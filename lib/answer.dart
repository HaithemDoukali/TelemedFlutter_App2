import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function
      selectHandler; // whats stored here is a pointer - value thats stored in the value is a function
  final String answerText;

  Answer(this.selectHandler, this.answerText); // Konstruktor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
