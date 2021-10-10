import 'package:SortingHat/dialogs/ContinueTest_Dialog.dart';
import 'package:SortingHat/screens/SavedResults_Screen.dart';
import 'package:SortingHat/screens/TestQuestion_Screen.dart';
import 'package:SortingHat/screens/Welcome_Screen.dart';
import 'package:SortingHat/utils/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
        ),
        title: Text("Sorting Hat"),
      ),
      floatingActionButton: Image.asset('images/hsl_logo.png', width: 100,),
      body: Scaffold(
        body: Center(
          child: OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createIntroText(),
                  SizedBox(
                    height: 0,
                    width: 50,
                  ),
                  createHomeButton()
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createIntroText(),
                  SizedBox(
                    height: 50,
                    width: 0,
                  ),
                  createHomeButton()
                ],
              );
            }
          },)
        ),
      ),
    );
  }

  Widget createHomeButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
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
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
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

  Widget createIntroText() {
    return Container(
      width: 300,
      child: Text(
        "Welcome!\n\n"
        "With this test you can find out which specialisation is the best fit for you.\n\n"
        "These specialisations are teached at De Hogeschool Leiden",
        overflow: TextOverflow.ellipsis,
        maxLines: 100,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20
        ),
      ),
    );
  }

  void _showDialogContinueTest() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ContinueTestDialogWidget(context: context,);
      },
    );
  }

  void _startTestHandler() {
    // showDialog(context: context, builder: (context) => ShareResultWidget());
    if (LocalUser.currentQuestion != 0) {
      _showDialogContinueTest();
    } else {
      LocalUser.resetUser();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TestQuestionScreen();
      }));
    }
  }

  void _gotoSavedResults() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SavedResultsScreen();
    }));
  }
}
