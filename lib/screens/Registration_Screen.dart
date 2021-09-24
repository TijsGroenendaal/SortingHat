import 'package:SortingHat/screens/Home_Screen.dart';
import 'package:SortingHat/widgets/InputForm_Widget.dart';
import 'package:SortingHat/widgets/TitleWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "RegistrationScreen";

  @override
  State<RegistrationScreen> createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationScreen> {
  bool _inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _inAsyncCall,
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleWidget(),
                  SizedBox(width: 50,),
                  FormWidget(title: 'Register', onPressed: registerHandler,),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleWidget(),
                  SizedBox(height: 50,),
                  FormWidget(title: 'Register', onPressed: registerHandler,)
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void registerHandler(String email, String password, FirebaseAuth _auth) async {
    setState(() {
      _inAsyncCall = true;
    });
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (newUser != null) {
        setState(() {
          _inAsyncCall = false;
        });
        Navigator.pushNamed(context, HomeScreen.id);
      }
    } catch(e) {
      setState(() {
        _inAsyncCall = false;
      });
    }
  }
}