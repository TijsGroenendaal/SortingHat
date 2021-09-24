import 'dart:ui';

import 'package:SortingHat/screens/Login_Screen.dart';
import 'package:SortingHat/screens/Registration_Screen.dart';
import 'package:SortingHat/widgets/RoundedButton_Widget.dart';
import 'package:SortingHat/widgets/TitleWidget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "WelcomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome"
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleWidget(),
                SizedBox(width: 50,),
                ButtonWidget(),
              ],
            );
          } {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.lightBlueAccent[100]
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontFamily: 'BebasNeue'
                    ),
                    child: AnimatedTextKit(
                      stopPauseOnTap: true,
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'IAT',
                          speed: Duration(milliseconds: 200)
                        ),
                        TypewriterAnimatedText(
                          'SE',
                          speed: Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'BDAM',
                          speed: Duration(milliseconds: 200),
                        ),
                        TypewriterAnimatedText(
                          'FICT',
                          speed: Duration(milliseconds: 200),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                TitleWidget(),
                SizedBox(height: 50,),
                ButtonWidget(),
              ],
            );
          }
        },
      )
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        RoundedButton(
          title: "Login",
          onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
        ),
        SizedBox(height: 60,),
        RoundedButton(
          title: "Register",
          onPressed: () => Navigator.pushNamed(context, RegistrationScreen.id),
        ),
      ],
    );
  }
}