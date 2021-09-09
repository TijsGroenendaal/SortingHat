import 'package:Sorteerhoed/utils/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SavedResults_Screen.dart';
import 'TestQuestion_Screen.dart';
import 'TestStart_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          child: Container(
            width: 200,
            height: 70,
            child: Center(
              child: Text(
                "Start Test",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          onPressed: () => _startTestHandler(),
        ),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: Container(
            width: 200,
            height: 70,
            child: Center(
              child: Text(
                "Show results",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          onPressed: () => _gotoSavedResults(),
        ),
      ],
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            title: Text(
              "Do you want to continue where you left?",
              textAlign: TextAlign.center,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),)
                  ),
                  onPressed: () => _resetOldTest(),
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 20),
                  )),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),),
                    backgroundColor: MaterialStateProperty.all(Colors.blue[400])
                  ),
                  onPressed: () => _continueOldTest(),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 20),
                  )
                ),
              ],
            )
        );
      },
    );
  }

  void _resetUser() {
    User.specialisation = "Unknown";
    User.currentQuestion = 0;
    User.answersPointList.clear();
    User.specialisationPoints = [0, 0, 0, 0];
  }

  void _startTestHandler() {
    if (User.currentQuestion != 0) {
      _showDialog();
    } else {
      _resetUser();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TestStartScreen();
      }));
    }
  }

  void _continueOldTest() {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return TestQuestionScreen();
        }));
  }

  void _resetOldTest() {
    _resetUser();
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return TestQuestionScreen();
        }));
  }

  void _gotoSavedResults() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SavedResultsScreen();
    }));
  }
}
