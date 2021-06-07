import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz/asset_file.dart';
import 'package:quizz/flow_page.dart';
import 'package:quizz/models/course.dart';
import 'package:quizz/models/question.dart';
import 'package:quizz/values/colors.dart';
import 'package:quizz/values/textstyle.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  bool isLoading = false;
  bool isLoadSuccess = false;

  List<Course>? course = [];

  void setStateLoading({bool? isLoading, bool? success}) {
    setState(() {
      this.isLoading = isLoading ?? false;
      this.isLoadSuccess = success ?? false;
    });
  }

  loadDataFromAssets() async {
    try {
      final String response = await rootBundle.loadString(AssetFile.cb16052021);
      final data = await json.decode(response);
      List<Course> result = (data["courses"] as List<dynamic>)
          .map((e) => Course.formJson(e))
          .toList();
      return result;
    } catch (_) {
      return null;
    }
  }

  loadData() async {
    setStateLoading(isLoading: true);
    List<Course>? data = await loadDataFromAssets();
    setStateLoading(success: true);
    setState(() {
      this.course = data;
    });
  }

  @override
  void initState() {
    super.initState();

    // () async {
    //   await loadData();
    // };

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      setStateLoading(isLoading: true);

      List<Course>? data = await loadDataFromAssets();

      setStateLoading(success: true);

      setState(() {
        this.course = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Course", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: AppColor.textColor,
        ),
        body: render());
  }

  Widget render() {
    if (isLoading) {
      return loading();
    } else if (isLoadSuccess) {
      if (course?.isEmpty ?? true) {
        return empty();
      } else {
        return courseList();
      }
    }
    return empty();
  }

  Widget loading() => Center(child: Text("Đang tải dữ liệu"));

  Widget empty() => Center(
        child: Text("Chưa có khoá học nào"),
      );

  Widget courseList() => ListView.builder(
      itemCount: course?.length ?? 0,
      itemBuilder: (_, index) => courseItem(course?[index] ?? null));

  Widget courseItem(Course? course) => course == null
      ? Container()
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => FlowPage(course: course)));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: AppColor.violet,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        course.course ?? "",
                        style: AppTextStyle.heading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Số câu hỏi: ${course.questions.length}",
                        style:
                            TextStyle(color: AppColor.textColor, fontSize: 16),
                      ),
                    )
                  ],
                )),
          ),
        );
}
