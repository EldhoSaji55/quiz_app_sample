import 'package:flutter/material.dart';
import 'package:quiz_app_sample/utils/color_constants.dart';
import 'package:quiz_app_sample/view/Question_Screen/dummy_db.dart';
import 'package:quiz_app_sample/view/Question_Screen/questionScreen.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.rightanswercount});
  final int rightanswercount;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int starcount = 0;
  calculatestarCount() {
    var percentage =
        (widget.rightanswercount / DummyDb.questionList.length) * 100;

    if (percentage > 80) {
      starcount = 3;
    } else if (percentage >= 50) {
      starcount = 2;
    } else if (percentage >= 30) {
      starcount = 1;
    } else {
      starcount = 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    calculatestarCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late int finalscore = widget.rightanswercount;
    late int toatalQuestions = DummyDb.questionList.length;
    ;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, bottom: index == 1 ? 30 : 0),
                    child: Icon(
                      Icons.star,
                      color: index <= starcount
                          ? ColorConstants.Orange
                          : ColorConstants.mainWhite,
                      size: index == 1 ? 80 : 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Congratulations",
                style: TextStyle(
                    color: ColorConstants.Orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "Your Score",
                style: TextStyle(
                    color: ColorConstants.Orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                " $finalscore / $toatalQuestions",
                style: TextStyle(
                    color: ColorConstants.Orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.mainWhite,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Questionscreen(),
                        ),
                        (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Restart",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.Orange),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
