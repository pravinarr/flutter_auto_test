import 'package:flutter_auto_test/src/model/image_pair.dart';

class TestResult {
  final List<ImagePair> imagePairs;
  final double threshold;

  TestResult({required this.imagePairs, required this.threshold});
  int get totalTestCount => imagePairs.length;

  int get failedTestCount => imagePairs
      .where((ImagePair imagePair) => imagePair.score > threshold)
      .length;

  int get passedTestCount => imagePairs
      .where((ImagePair imagePair) => imagePair.score <= threshold)
      .length;

  double get averageScore =>
      imagePairs
          .map((ImagePair imagePair) => imagePair.matchScorePercentage)
          .reduce((double a, double b) => a + b) /
      imagePairs.length;

  double get maxScore => imagePairs
      .map((ImagePair imagePair) => imagePair.matchScorePercentage)
      .reduce((double a, double b) => a > b ? a : b);

  double get minScore => imagePairs
      .map((ImagePair imagePair) => imagePair.matchScorePercentage)
      .reduce((double a, double b) => a < b ? a : b);

  double get passedTestPercentage => passedTestCount / totalTestCount * 100;

  double get failedTestPercentage => failedTestCount / totalTestCount * 100;
}
