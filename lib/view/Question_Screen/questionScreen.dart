import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:quiz_app_sample/utils/color_constants.dart';
import 'package:quiz_app_sample/view/Question_Screen/dummy_db.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key});

  @override
  State<Questionscreen> createState() => _QuestionscreenState();
}

class _QuestionscreenState extends State<Questionscreen> {
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.mainWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      DummyDb.questionList[questionIndex]['question'],
                      style: TextStyle(
                          color: ColorConstants.primaryColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorConstants.Orange)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DummyDb.questionList[questionIndex]['options']
                                [index],
                            style: TextStyle(
                                fontSize: 16, color: ColorConstants.mainWhite),
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: ColorConstants.mainWhite,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (questionIndex < DummyDb.questionList.length - 1) {
                  questionIndex = questionIndex + 1;
                  setState(() {});
                } else {
                  print("completed");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.Orange,
                  ),
                  child: Center(
                      child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.mainWhite,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
