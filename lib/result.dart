import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are the best blyaaaat';
    } else if (resultScore <= 12) {
      resultText = 'Its okay nahui';
    } else if (resultScore <= 16) {
      resultText = 'Yoi are strange ..';
    } else {
      resultText = 'You suck idiot ';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              child: Text('Restart Quiz'),
              textColor: Colors.blue,
              onPressed: resetHandler), // onPressed need adress of a function
        ],
      ),
    );
  }
}
