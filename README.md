<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->


## Features

This package can be used to generate report by comparing the screenshots on base screenshot images.

This way we can add one more layer to the flutter integartion testing and automate the verification process of screenshots generated

## Getting started

On your local system, run your integration tests and capture the screenshots in a folder.

###Note:

    ####1. Do not change the file names after the screenshots are generated. This library comapres the files based on the file names.
    ####2. Currently this library support jpg, jpeg, png formats 

## Usage

```
    final FlutterAutoTestBase flutterAutoTestBase = FlutterAutoTestBase();
  TestResult result = await flutterAutoTestBase.run(
      'example/images', 'example/images', 'report.html', 0.1);
  print('Passed Test Case Percentage :${result.passedTestPercentage}');
```

You can add this as a separate test case in your inegration testing and add assert statements based on the TestResult Values 