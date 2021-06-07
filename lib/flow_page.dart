import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizz/models/course.dart';
import 'package:quizz/models/question.dart';
import 'package:quizz/practice_page.dart';
import 'package:quizz/utils/util.dart';
import 'package:quizz/values/colors.dart';
import 'package:quizz/values/textstyle.dart';

class FlowPage extends StatefulWidget {
  final Course course;

  FlowPage({required this.course});

  @override
  _FlowPageState createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  Course? course;

  @override
  void initState() {
    course = widget.course;
    super.initState();
  }

  practiceQuestion() {
    List<int> randoms = fixedListRamdom(len: 10, max: course!.questions.length);
    List<Question> paractices = [];
    randoms.forEach((element) {
      paractices.add(course!.questions[element]);
    });
    return paractices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course?.course ?? ""),
        backgroundColor: AppColor.textColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PracticePage(practiceQuestion())));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.violet,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text("Ôn tập", style: AppTextStyle.heading),
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.violet,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text("Thi thử", style: AppTextStyle.heading),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
