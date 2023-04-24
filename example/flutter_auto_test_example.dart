import 'package:flutter_auto_test/flutter_auto_test.dart';

void main() {
  final FlutterAutoTestBase flutterAutoTestBase = FlutterAutoTestBase();
  flutterAutoTestBase.run('example/images', 'example/images', 'report.html', 0.1);
}
