import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/core/bloc/quizzes_bloc.dart';
import 'package:quiz_app/src/features/quiz/screen.dart';
import 'package:quiz_app/src/features/splash/screen.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizzesState>(builder: (context, state) {
      return state.when(
        initial: () {
          return const SplashScreen();
        },
        loading: () {
          return const SplashScreen();
        },
        loaded: (quizzes) {
          return const QuizScreen();
        },
        error: (messages, _) {
          // in this place we can added error screen
          return const ColoredBox(color: Colors.red);
        },
      );
    });
  }
}
