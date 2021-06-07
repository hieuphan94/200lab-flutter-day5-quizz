import 'package:quizz/models/question.dart';

class Course {
  late String? course;
  late List<Question> questions;

  Course.formJson(Map<String, dynamic> json) {
    this.course = json["course"];
    this.questions = (json["questions"] as List<dynamic>)
        .map((e) => Question.fromJson(e))
        .toList();
  }

  toJson() => {
        "course": this.course,
        "questions": this.questions.map((e) => e.toJson()).toList(),
      };
}
