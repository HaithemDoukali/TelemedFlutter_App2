import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // diese Klass kann rebuild werden
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // neues Objekt von MyAppState returnen
  }
}

class _MyAppState extends State<MyApp> {
  // State gehört zu MyApp
  final _questions = const [
    // Compile Konstant, never changes
    {
      'questionText': 'Whats\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 2},
      ],
    }, // Map - questionText/anwers is a 'key'

    {
      'questionText': 'Whats\'s your favorite beer?',
      'answers': [
        {'text': 'Sternburg', 'score': 1},
        {'text': 'Heineken', 'score': 3},
        {'text': 'Krombacher', 'score': 5},
        {'text': 'Radler', 'score': 10},
      ],
    },

    {
      'questionText': 'Whats\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Lion', 'score': 3},
        {'text': 'Snake', 'score': 8},
        {'text': 'Tiger', 'score': 2},
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    // _totalScore += score;

    setState(() {
      // setState -> updates "build" method
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // für Entwicklungszwecke ------------------------------------------------
  void createPatient() {
    print('Sie können nun Patienten anlegen');
  }

  void createConnection() {
    print('Sie können nun die Verbindung zum ESP-32 Board herstellen');
  }

  void data() {
    print('Verarbeitung der Daten');
  }

//----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Telemedizin Koffer-App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
