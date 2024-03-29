import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/core/bloc/quizzes_bloc.dart';
import 'package:quiz_app/src/features/quizs/bloc/quiz_score_bloc.dart';
import 'package:quiz_app/src/features/quizs/widgets/quiz_pages.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = context.read<QuizBloc>().state.quizzes;
    return BlocProvider(
      create: (context) => QuizScoreBloc(),
      child: Scaffold(
        body: quizzes == null
            // there we can show what we want when quizzes is null
            ? const Placeholder()
            : QuizPages(
                quizzes: quizzes,
              ),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
