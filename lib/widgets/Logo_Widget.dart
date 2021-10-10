import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;

  LogoWidget({this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/welcome_logo.png'),
      height: height,
    );
  }
}