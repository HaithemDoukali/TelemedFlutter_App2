import 'package:flutter/material.dart';

/*
*  Ouput the Question in a nice way
*/
class Question extends StatelessWidget {
  final String questionText; // final -> variable verändert sich nicht

  Question(this.questionText) {
    // Konstruktor
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
