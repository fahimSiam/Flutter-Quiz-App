import 'package:flutter/material.dart';

import './quiz.dart';
//import './answer.dart';
import './result.dart';

//st likle stateless/stateful hoye jae
// void main(){
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color?',
      'answers': [
        {'text': 'black', 'score': 7},
        {'text': 'green', 'score': 1},
        {'text': 'blue', 'score': 8},
      ],
    },
    //lists are with 3rd braket ar maps e 2nd bracket ar vitore 3rd
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'bunny', 'score': 3},
        {'text': 'cat', 'score': 7},
        {'text': 'dog', 'score': 10},
      ],
    },

    {
      'questionText': 'who\'s your favourite singer?',
      'answers': [
        {'text': 'Ed Sheeran', 'score': 10},
        {'text': 'green day', 'score': 5},
        {'text': 'weekend', 'score': 4},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    /*print(_questionIndex);
    if (_questionIndex < _questions.length) {
      //_questionIndex = 0;
      print('we have more questions');
    } else {
      print('no more questions! ');
    } */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
