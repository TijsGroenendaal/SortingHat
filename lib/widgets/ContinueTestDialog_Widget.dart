import 'package:SortingHat/utils/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SortingHat/screens/TestQuestion_Screen.dart';

class ContinueTestDialogWidget extends StatelessWidget{
  final BuildContext context;

  ContinueTestDialogWidget({Key key, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          "Do you want to continue where you left?",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => _resetOldTest(),
                child: Text(
                  "No",
                  style: TextStyle(fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () => _continueOldTest(),
                child: Text(
                  "Yes",
                  style: TextStyle(fontSize: 20),
                )
            ),
          ],
        )
    );
  }

  void _continueOldTest() {
    Navigator.pop(this.context);
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) {
          return TestQuestionScreen();
        }));
  }

  void _resetOldTest() {
    LocalUser.resetUser();
    Navigator.pop(this.context);
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) {
          return TestQuestionScreen();
        }));
  }
}