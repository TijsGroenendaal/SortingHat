import 'package:Sorteerhoed/utils/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TestQuestion_Screen.dart';

class TestStartScreen extends StatefulWidget {
  @override
  State<TestStartScreen> createState() => _TestStartState();
}

class _TestStartState extends State<TestStartScreen> {
  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Enter your name"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveNameHandler(),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(hintText: "Enter your Name"),
                maxLength: 20,
                controller: myController,
              ),
            ),
          ),
        ],
      )
    );
  }

  _saveNameHandler() {
    User.name = myController.text;
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TestQuestionScreen();
    }));
  }
}
