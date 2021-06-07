import 'package:flutter/material.dart';
import 'package:quizz/values/colors.dart';

import 'models/answer.dart';

class AnswerItem extends StatefulWidget {
  final Answer answer;

  AnswerItem(this.answer);

  @override
  _AnswerItemState createState() => _AnswerItemState();
}

class _AnswerItemState extends State<AnswerItem> {
  Color backgroundColor = AppColor.violet;
  Answer? answer;

  answerCheck() {
    setState(() {
      backgroundColor = answer!.isCorrect! ? AppColor.cyan : AppColor.red;
    });
  }

  @override
  void initState() {
    answer = widget.answer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerCheck,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(color: backgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer?.text ?? "",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
