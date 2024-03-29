import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Quizzes is loading',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
