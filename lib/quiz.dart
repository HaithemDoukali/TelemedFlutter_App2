import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions; // runtime constant values
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions, // @required - all this variables are required
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // invisble Widget (for Layout & Control)
      children: [
        //Text('Wählen Sie Ihre gewünschte Aktion aus!'),
        Question(questions[questionIndex][
            'questionText']), // benutzen der Klasse: Question, Kontruktor erwartet Text
        ...(questions[questionIndex]['answers'] as List<
                Map<String, Object>>) // ... one list, add value of list in list
            .map((answer) {
          return Answer(
              () => answerQuestion(answer[
                  'score']), // anonymous function forward the adress to answer
              answer['text']);
          // only got executed when button is pressed
        }).toList()
      ],
    );
  }
}
