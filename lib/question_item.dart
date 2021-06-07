import 'package:flutter/material.dart';
import 'package:quizz/answer_item.dart';
import 'package:quizz/models/answer.dart';
import 'package:quizz/models/question.dart';
import 'package:quizz/values/colors.dart';
import 'package:quizz/values/textstyle.dart';

class QuestionItem extends StatefulWidget {
  final Question question;

  QuestionItem(this.question);

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  Question? question;

  @override
  void initState() {
    question = widget.question;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = question!.answers!
        .map((e) =>
            Container(margin: const EdgeInsets.all(8), child: AnswerItem(e)))
        .toList()
          ..add(Container(child: Spacer()))
          ..add(Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              question?.question ?? "",
              style: AppTextStyle.heading,
            ),
          ));

    return Column(
      children: children.reversed.toList(),
    );
  }
}
