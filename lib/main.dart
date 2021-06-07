import 'package:flutter/material.dart';
import 'package:quizz/course_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: CoursePage(),
    );
  }
}
