import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogButtonWidget extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String message;
  final Function function;

  DialogButtonWidget({
    this.buttonColor,
    this.textColor,
    this.function,
    this.message
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor)
            ),
            onPressed: () {
              function(context);
            },
            child: Text(
              message,
              style: TextStyle(
                  fontSize: 30,
                  color: textColor,
              ),
            ),
          ),
        )
    );
  }
}