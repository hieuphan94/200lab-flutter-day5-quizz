import 'package:quizz/models/answer.dart';

class Question {
  late String? question;
  late int? level;
  late List<Answer>? answers;

  Question({this.question, this.level, this.answers});

  Question.fromJson(Map<String, dynamic> json) {
    this.question = json["question"];
    this.level = json["level"];
    this.answers = (json["answer"] as List<dynamic>)
        .map((e) => Answer.formJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        "question": this.question,
        "level": this.level,
        "answer": this.answers?.map((e) => e.toJson()).toList()
      };
}
