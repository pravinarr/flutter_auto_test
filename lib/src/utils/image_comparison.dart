import 'dart:io';
import 'package:image_compare/image_compare.dart';

class ImageCompare {
  Future<double> getScore(String image1, String image2) async {
    double score = await compareImages(
        src1: File(image1),
        src2: File(image2),
        algorithm: ChiSquareDistanceHistogram(ignoreAlpha: true));
    return score;
  }
}
