import 'package:flutter/material.dart';

import 'Logo_Widget.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: "Logo",
          child: LogoWidget(height: 60,)
        ),
        SizedBox(width: 10.0,),
        Hero(
          tag: 'Title',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              "SortingHat",
              style: TextStyle(
                fontSize: 50.0
              ),
            ),
          ),
        )
      ],
    );
  }
}