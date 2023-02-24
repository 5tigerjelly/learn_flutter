import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    print('Answer chosen');
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': "Favorite Color?",
        'answers': ['Black', 'Red', 'Purple', 'White']
      },
      {
        'questionText': "Favorite animal?",
        'answers': ['Rabbit', 'Snake', 'Lion', 'Elephant']
      },
      {
        'questionText': "Favorite city?",
        'answers': ['Seattle', 'New York', 'Tokyo', 'Seoul']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions.elementAt(_questionIndex)['questionText']),
            ...(questions.elementAt(_questionIndex)['answers'] as List<String>)
                .map(
                  (answers) => Answer(_answerQuestion, answers),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
