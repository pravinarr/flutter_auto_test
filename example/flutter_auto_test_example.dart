import 'package:flutter_auto_test/flutter_auto_test.dart';
import 'package:flutter_auto_test/src/model/test_result.dart';

void main() async {
  final FlutterAutoTestBase flutterAutoTestBase = FlutterAutoTestBase();
  TestResult result = await flutterAutoTestBase.run(
      'example/images', 'example/images', 'report.html', 0.1);
  print('Passed Test Case Percentage :${result.passedTestPercentage}');
}
