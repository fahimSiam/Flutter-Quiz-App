import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'you did it!';
    if (resultScore >= 20) {
      resultText = 'You are awesome and we should be friends!';
    } else if (resultScore >= 15) {
      resultText = 'Pretty likeable';
    } else if (resultScore >= 12) {
      resultText = 'You are...a weirdo?';
    } else {
      resultText = 'You a freak';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: () => resetHandler(),
          )
        ],
      ),
    );
  }
}
