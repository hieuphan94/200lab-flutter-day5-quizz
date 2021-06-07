class Answer {
  late String? text;
  late bool? isCorrect;

  Answer({this.text, this.isCorrect});

  //static
  Answer.formJson(Map<String, dynamic> json) {
    this.isCorrect = json["isCorrect"];
    this.text = json["text"];
  }

  Map<String, dynamic> toJson() =>
      {"isCorrect": this.isCorrect, "text": this.text};
}
