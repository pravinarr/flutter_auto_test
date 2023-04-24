import 'package:flutter_auto_test/src/executor/test_report_executor.dart';

class FlutterAutoTestBase {
  final TestReportExecutor testReportExecutor = TestReportExecutor();

  Future<void> run(String referenceFolderPath, String targetFolderPath,
      String reportPath, double threshold) async {
    testReportExecutor.generateReport(
        await testReportExecutor.getScoredResult(
            referenceFolderPath, targetFolderPath, threshold),
        reportPath,
        threshold);
  }
}

void main(
    {String refPath = 'ref/images',
    String tarPath = 'target/images',
    String reportPath = 'report.html',
    double threshold = 0.1}) {
  final FlutterAutoTestBase flutterAutoTestBase = FlutterAutoTestBase();
  flutterAutoTestBase.run(refPath, tarPath, reportPath, threshold);
}
