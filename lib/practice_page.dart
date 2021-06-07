import 'package:flutter/material.dart';
import 'package:quizz/models/question.dart';
import 'package:quizz/question_item.dart';
import 'package:quizz/values/colors.dart';

class PracticePage extends StatefulWidget {
  final List<Question> question;

  PracticePage(this.question);

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<Question> question = [];
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    question = widget.question;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.textColor,
        title: Text('Câu ${currentIndex + 1}  / ${question.length}'),
      ),
      body: PageView.builder(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: question.length,
          itemBuilder: (_, index) => QuestionItem(question[index])),
    );
  }
}
