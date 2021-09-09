import 'package:Sorteerhoed/utils/QuestionData.dart';
import 'package:Sorteerhoed/utils/User.dart';
import 'package:Sorteerhoed/utils/DatabaseHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TestResult_Screen.dart';

class TestQuestionScreen extends StatefulWidget {
  @override
  State<TestQuestionScreen> createState() => _TestQuestionState();
}

class _TestQuestionState extends State<TestQuestionScreen> {
  QuestionData variable = QuestionData();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Question " + ((User.currentQuestion + 1).toString()),
        ),
        actions: [
          ElevatedButton(
              onPressed: () => _moveBackHandler(),
              child: Text(
                "Back",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
          )
        ],
      ),
      body: Center(
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    variable.questionList[User.currentQuestion],
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Column(
              children: List.generate(variable.possibleAnswerList.length + variable.possibleAnswerList.length, (index) {
                bool chosen;
                int i = index ~/ 2;
                if (User.currentQuestion < User.answersPointList.length) {
                  if (i ==
                      (User.answersPointList[User.currentQuestion] - 4) * -1) {
                    chosen = true;
                  } else {
                    chosen = false;
                  }
                } else {
                  chosen = false;
                }
                if (index.isOdd) {
                  return Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.white,
                  );
                }

                return ElevatedButton(
                  onPressed: () => _nextQuestionHandler(i),
                  child: Container(
                    height: 50,
                    width: 270,
                    child: Center(
                      child: Text(
                        variable.possibleAnswerList[i],
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(chosen ? Colors.blueAccent : Colors.blue[400],),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                  )
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _calculatePoints(int value) {
    value = (value - 4) * -1;
    try {
      User.answersPointList[User.currentQuestion] = value;
    } on RangeError {
      User.answersPointList.add(value);
    }
  }

  void _calculateSpecialisation() {
    List<int> specialisationMaxPoints = [372, 380, 372, 380];

    for (int i = 0; i < 20; i++) {
      for (int o = 0; o < 4; o++) {
        int temp = User.answersPointList[i] * variable.questionPointsList[i][o];
        User.specialisationPoints[o] = temp + User.specialisationPoints[o];
      }
    }

    for (int i = 0; i < 4; i++) {
      double temp = (User.specialisationPoints[i] / specialisationMaxPoints[i]) * 100;
      User.specialisationPoints[i] = temp ~/ 1;
    }
  }

  void _nextQuestionHandler(int i) {
    _calculatePoints(i);
    if (User.currentQuestion != 19) {
      setState(() {
        User.currentQuestion += 1;
      });
      _scrollBackHandler();

    } else if (User.currentQuestion == 19) {
      setState(() {
        User.currentQuestion = 0;
      });
      _calculateSpecialisation();
      User.setSpecialisation();
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return TestResultScreen();
          }));
      DatabaseHandler.insert();
    }
  }

  void _moveBackHandler() {
    if (User.currentQuestion != 0) {
      setState(() {
        User.currentQuestion -= 1;
      });
      _scrollBackHandler();
    }
  }

  void _scrollBackHandler() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
