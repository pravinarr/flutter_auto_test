import 'package:flutter_auto_test/src/model/image_pair.dart';
import 'package:flutter_auto_test/src/model/test_result.dart';

class GenerateHtml {
  String getFileNameFromPath(String path) {
    return path.split('/').last;
  }

  String generateHtml(TestResult testResult) {
    final StringBuffer buffer = StringBuffer();

    buffer.writeln('<!DOCTYPE html>');
    buffer.writeln('<html>');
    buffer.writeln('<head>');
    buffer.writeln('<title>Test Results</title>');
    buffer.writeln(
        '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >');
    buffer.writeln(
        '<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>');
    buffer.writeln(
        '<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>');
    buffer.writeln(
        '<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"  crossorigin="anonymous"></script>');
    buffer.writeln('</head>');
    buffer.writeln('<body>');
    buffer.writeln('<div class="container">');
    buffer.writeln('<h1 class="text-center">Test Results</h1>');

    // Table displaying the metrics
    buffer.writeln('<div class="row">');
    buffer.writeln('<div class="col-md-8 offset-md-2">');
    buffer.writeln('<table class="table table-bordered">');
    buffer.writeln('<thead class="thead-light">');
    buffer.writeln('<tr>');
    buffer.writeln('<th>Metric</th>');
    buffer.writeln('<th>Value</th>');
    buffer.writeln('</tr>');
    buffer.writeln('</thead>');
    buffer.writeln('<tbody>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Total Test Count</td>');
    buffer.writeln('<td>${testResult.totalTestCount}</td>');
    buffer.writeln('</tr>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Failed Test Count</td>');
    buffer.writeln('<td>${testResult.failedTestCount}</td>');
    buffer.writeln('</tr>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Passed Test Count</td>');
    buffer.writeln('<td>${testResult.passedTestCount}</td>');
    buffer.writeln('</tr>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Average Score</td>');
    buffer.writeln('<td>${testResult.averageScore.toStringAsFixed(2)}</td>');
    buffer.writeln('</tr>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Max Score</td>');
    buffer.writeln('<td>${testResult.maxScore}</td>');
    buffer.writeln('</tr>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Min Score</td>');
    buffer.writeln('<td>${testResult.minScore}</td>');
    buffer.writeln('</tr>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Passed Test Percentage</td>');
    buffer.writeln(
        '<td>${testResult.passedTestPercentage.toStringAsFixed(2)}%</td>');
    buffer.writeln('</tr>');
    buffer.writeln('<tr>');
    buffer.writeln('<td>Failed Test Percentage</td>');
    buffer.writeln(
        '<td>${testResult.failedTestPercentage.toStringAsFixed(2)}%</td>');
    buffer.writeln('</tr>');
    buffer.writeln('</tbody>');
    buffer.writeln('</table>');
    buffer.writeln('</div>');
    buffer.writeln('</div>');
    buffer.writeln('<div id="accordion">');

    List<ImagePair> imagePairs = testResult.imagePairs;
    for (int i = 0; i < imagePairs.length; i++) {
      final String? image1 = imagePairs[i].image1Path;
      final String? image2 = imagePairs[i].image2Path;
      final double score = imagePairs[i].matchScorePercentage;

      buffer.writeln('<div class="card">');
      buffer.writeln('<div class="card-header" id="heading-$i">');
      buffer.writeln('<h5 class="mb-0">');
      buffer.writeln(
          '<button class="btn btn-link" data-toggle="collapse" data-target="#collapse-$i" aria-expanded="false" aria-controls="collapse-$i">');
      buffer.writeln(
          'File: ${getFileNameFromPath(image1 ?? image2 ?? '/NotAvailable')} - Score: $score');
      buffer.writeln('</button>');
      buffer.writeln('</h5>');
      buffer.writeln('</div>');

      buffer.writeln(
          '<div id="collapse-$i" class="collapse" aria-labelledby="heading-$i" data-parent="#accordion">');
      buffer.writeln('<div class="card-body">');
      buffer.writeln('<div class="row">');
      buffer.writeln('<div class="col-md-6 text-center">');
      buffer.writeln('<img src="$image1" alt="Image 1" class="img-fluid">');
      buffer.writeln('</div>');
      buffer.writeln('<div class="col-md-6 text-center">');
      buffer.writeln('<img src="$image2" alt="Image 2" class="img-fluid">');
      buffer.writeln('</div>');
      buffer.writeln('</div>');
      buffer.writeln('</div>');
      buffer.writeln('</div>');
    }

    buffer.writeln('</div>');
    buffer.writeln('</div>');
    buffer.writeln('</div>');
    buffer.writeln('</body>');
    buffer.writeln('</html>');

    return buffer.toString();
  }
}
