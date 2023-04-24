import 'dart:io';

import 'package:flutter_auto_test/src/model/image_pair.dart';
import 'package:flutter_auto_test/src/model/test_result.dart';
import 'package:flutter_auto_test/src/utils/generate_html.dart';
import 'package:flutter_auto_test/src/utils/image_comparison.dart';

class TestReportExecutor {
  List<String> getAllImagesInPath(String path) {
    final List<String> images = [];
    final Directory dir = Directory(path);
    final List<FileSystemEntity> files = dir.listSync(recursive: true);
    for (final FileSystemEntity file in files) {
      if (file.path.endsWith('.png') ||
          file.path.endsWith('.jpg') ||
          file.path.endsWith('.jpeg')) {
        images.add(file.path);
      }
    }
    return images;
  }

  Map<String, String> getFileNameAndPathMapFromImages(List<String> images) {
    final Map<String, String> fileNameAndPathMap = {};
    for (final String image in images) {
      final String fileName = image.split('/').last;
      fileNameAndPathMap[fileName] = image;
    }
    return fileNameAndPathMap;
  }

  Future<List<ImagePair>> getScoredImagePairs(
      Map<String, String> referenceFileNameAndPathMap,
      Map<String, String> targetFileNameAndPathMap) async {
    final ImageCompare imageCompare = ImageCompare();
    final List<ImagePair> imagePairs = [];
    final List<String> imageNames = referenceFileNameAndPathMap.keys.toList();
    for (int i = 0; i < imageNames.length; i++) {
      final String? image1 = referenceFileNameAndPathMap[imageNames[i]];
      final String? image2 = targetFileNameAndPathMap[imageNames[i]];
      imagePairs.add(ImagePair(
          image1Path: image1,
          image2Path: image2,
          score: (image1 == null || image2 == null)
              ? 0
              : await imageCompare.getScore(image1, image2)));
    }
    return imagePairs;
  }

  Future<List<ImagePair>> getScoredResult(String referenceFolderPath,
      String targetFolderPath, double threshold) async {
    final List<String> referenceImages =
        getAllImagesInPath(referenceFolderPath);
    final List<String> targetImages = getAllImagesInPath(targetFolderPath);
    final Map<String, String> referenceFileNameAndPathMap =
        getFileNameAndPathMapFromImages(referenceImages);
    final Map<String, String> targetFileNameAndPathMap =
        getFileNameAndPathMapFromImages(targetImages);
    return await getScoredImagePairs(
        referenceFileNameAndPathMap, targetFileNameAndPathMap);
  }

  void generateReport(
      List<ImagePair> imagePairs, String reportPath, double threshold) {
    final GenerateHtml generateHtml = GenerateHtml();
    final String html = generateHtml
        .generateHtml(TestResult(imagePairs: imagePairs, threshold: threshold));
    final File htmlFile = File(reportPath);
    htmlFile.writeAsStringSync(html);
  }

  Future<void> run(String referenceFolderPath, String targetFolderPath,
      String reportPath, double threshold) async {
    final List<ImagePair> imagePairs =
        await getScoredResult(referenceFolderPath, targetFolderPath, threshold);
    generateReport(imagePairs, reportPath, threshold);
  }
}
