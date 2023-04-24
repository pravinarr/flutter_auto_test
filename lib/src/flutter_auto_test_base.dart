import 'package:flutter_auto_test/src/executor/test_report_executor.dart';
import 'package:flutter_auto_test/src/model/test_result.dart';

class FlutterAutoTestBase {
  final TestReportExecutor testReportExecutor = TestReportExecutor();

  Future<TestResult> run(String referenceFolderPath, String targetFolderPath,
      String reportPath, double threshold) async {
    return await testReportExecutor.run(
        referenceFolderPath, targetFolderPath, reportPath, threshold);
  }
}
