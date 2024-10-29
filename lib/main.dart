import 'package:flutter/material.dart';
import 'package:quiz_app_sample/utils/color_constants.dart';
import 'package:quiz_app_sample/view/Question_Screen/questionScreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: ColorConstants.primaryColor),
      debugShowCheckedModeBanner: false,
      home: Questionscreen(),
    );
  }
}
