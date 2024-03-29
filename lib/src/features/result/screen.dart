import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int score;

  const Result({
    required this.score,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your score $score'),
      ),
    );
  }
}
