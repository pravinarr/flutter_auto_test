class ImagePair {
  final String? image1Path;
  final String? image2Path;
  final double score;
  late final bool image1NotAvailable;
  late final bool image2NotAvailable;

  double get matchScorePercentage =>
      (image1NotAvailable || image2NotAvailable) ? 0.00 : (1 - score) * 100;

  ImagePair({required this.score, this.image1Path, this.image2Path}) {
    image1NotAvailable = image1Path == null;
    image2NotAvailable = image2Path == null;
  }
}
