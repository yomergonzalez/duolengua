import 'package:flutter/material.dart';

class LessonButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;

  LessonButton(
      {Key key,
      @required this.title,
        @required this.color,
        @required this.textColor,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.grey[300],
      disabledTextColor: Colors.grey,
      textColor: textColor,
      onPressed: onPressed,
      elevation: 4,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.all(10),
      color: color,
      splashColor: color,
      child: Text(title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold)),
    );
  }
}
