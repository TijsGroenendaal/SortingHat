import 'package:SortingHat/decoration/decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'RoundedButton_Widget.dart';

class FormWidget extends StatefulWidget {
  final Function onPressed;
  final String title;

  FormWidget({
    @required this.title,
    @required this.onPressed,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
              style: TextStyle(
                  color: Colors.black
              ),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: "Enter your email",
              )
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        SizedBox(
          width: 300,
          child: TextField(
              style: TextStyle(
                  color: Colors.black
              ),
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'
              )
          ),
        ),
        RoundedButton(
          title: widget.title,
          onPressed: () => widget.onPressed(email, password, FirebaseAuth.instance),
        )
      ],
    );
  }
}