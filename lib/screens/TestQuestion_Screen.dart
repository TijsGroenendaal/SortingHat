import 'package:SortingHat/utils/QuestionData.dart';
import 'package:SortingHat/utils/User.dart';
import 'package:SortingHat/utils/DatabaseHandler.dart';
import 'package:SortingHat/widgets/ShareResult_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text(
          "Question " + ((LocalUser.currentQuestion + 1).toString()),
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              ))
            ),
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
                    variable.questionList[LocalUser.currentQuestion],
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Column(
              children: List.generate(variable.possibleAnswerList.length * 2, (index) {
                int i = index ~/ 2;
                if (index.isOdd) {
                  return Divider();
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
      LocalUser.answersPointList[LocalUser.currentQuestion] = value;
    } on RangeError {
      LocalUser.answersPointList.add(value);
    }
  }

  void _calculateSpecialisation() {
    List<int> specialisationMaxPoints = [372, 380, 372, 380];
    List<String> nameList = ["FICT", "IAT", "SE", "BDAM"];

    for (int i = 0; i < 20; i++) {
      for (int o = 0; o < 4; o++) {
        int temp = LocalUser.answersPointList[i] * variable.questionPointsList[i][o];
        LocalUser.specialisationPoints[nameList[o]] = temp + LocalUser.specialisationPoints[nameList[o]];
      }
    }

    for (int i = 0; i < 4; i++) {
      double temp = (LocalUser.specialisationPoints[nameList[i]] / specialisationMaxPoints[i]) * 100;
      LocalUser.specialisationPoints[nameList[i]] = temp ~/ 1;
    }
  }

  void _nextQuestionHandler(int i) {
    _calculatePoints(i);
    if (LocalUser.currentQuestion != 19) {
      setState(() {
        LocalUser.currentQuestion += 1;
      });
      _scrollBackHandler();

    } else if (LocalUser.currentQuestion == 19) {
      _calculateSpecialisation();
      LocalUser.setSpecialisation();
      Navigator.pop(context);
      showDialog(context: context, builder: (context) => ShareResultWidget());
      DatabaseHandler.insert();
    }
  }

  void _moveBackHandler() {
    if (LocalUser.currentQuestion != 0) {
      setState(() {
        LocalUser.currentQuestion -= 1;
      });
      _scrollBackHandler();
    }
  }

  void _scrollBackHandler() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }
}
