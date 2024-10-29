import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:quiz_app_sample/utils/color_constants.dart';
import 'package:quiz_app_sample/view/Question_Screen/dummy_db.dart';
import 'package:quiz_app_sample/view/Results_Screen/results_screen.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key});

  @override
  State<Questionscreen> createState() => _QuestionscreenState();
}

class _QuestionscreenState extends State<Questionscreen> {
  int questionIndex = 0;
  int correctAnswer = 0;
  int? selectedAnswerIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorConstants.primaryColor,
        title: Text(
          "Quiz App",
          style: TextStyle(
              color: ColorConstants.Orange,
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
        actions: [
          Text(
            "${questionIndex + 1}/${DummyDb.questionList.length}",
            style: TextStyle(color: ColorConstants.mainWhite, fontSize: 18),
          )
        ],
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        DummyDb.questionList[questionIndex]['question'],
                        style: TextStyle(
                            color: ColorConstants.primaryColor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                if(selectedAnswerIndex == DummyDb.questionList[questionIndex]["answerIndex"])
                  
              ),
            ),
            Column(
              children: List.generate(
                4,
                (optionIndex) => InkWell(
                  onTap: () {
                    selectedAnswerIndex = null;
                    selectedAnswerIndex = optionIndex;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: getColor(optionIndex))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DummyDb.questionList[questionIndex]['options']
                                  [optionIndex],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorConstants.mainWhite),
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
            ),
            SizedBox(
              height: 20,
            ),
            if (selectedAnswerIndex != null)
              InkWell(
                onTap: () {
                  selectedAnswerIndex = null;
                  if (questionIndex < DummyDb.questionList.length - 1) {
                    questionIndex = questionIndex + 1;
                    setState(() {});
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(
                            rightanswercount: correctAnswer,
                          ),
                        ));
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

  Color getColor(int CurrentOptionIndex) {
    if (selectedAnswerIndex == null) {
      if (selectedAnswerIndex !=
          DummyDb.questionList[questionIndex]['answerIndex']) {
        return ColorConstants.red;
      }
    }

    if (selectedAnswerIndex !=
        DummyDb.questionList[questionIndex]['answerIndex']) {
      return ColorConstants.red;
    } else {
      return ColorConstants.green;
    }
  }
}
