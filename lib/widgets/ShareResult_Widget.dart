import 'package:SortingHat/utils/FirestoreHandler.dart';
import 'package:SortingHat/utils/User.dart';
import 'package:SortingHat/widgets/DialogButton_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SortingHat/screens/TestResult_Screen.dart';

class ShareResultWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Do you wish to share your result with the world",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                DialogButtonWidget(
                  textColor: Colors.green[800],
                  message: "Yes",
                  buttonColor: Colors.greenAccent[400],
                  function: pressedYesHandler,
                ),
                DialogButtonWidget(
                  textColor: Colors.red[900],
                  message: "No",
                  buttonColor: Colors.red,
                  function: pressedNoHandler,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void pressedYesHandler(BuildContext context) {
    moveToResultScreen(context);
    FireStoreHandler.firebaseApp.collection("results").add(
        {
          "name" : LocalUser.name,
          "points" : LocalUser.specialisationPoints,
          "result" : LocalUser.specialisation
        });
  }

  void pressedNoHandler(BuildContext context) {
    moveToResultScreen(context);
  }

  void moveToResultScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return TestResultScreen(user: ResultUser(
            specialisationPoints: LocalUser.specialisationPoints,
            specialisation: LocalUser.specialisation,
            name: LocalUser.name,
          ));
        })
    );
  }
}
