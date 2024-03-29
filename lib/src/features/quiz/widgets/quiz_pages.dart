import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/core/app/model/quiz_model.dart';
import 'package:quiz_app/src/features/quiz/bloc/quiz_score_bloc.dart';
import 'package:quiz_app/src/features/quiz/widgets/quiz_card.dart';

import 'package:quiz_app/src/features/result/screen.dart';

class QuizPages extends StatelessWidget {
  QuizPages({
    required this.quizzes,
    super.key,
  });

  final _pageController = PageController();
  final List<Quiz> quizzes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: quizzes.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              QuizCard(
                quizzesLength: quizzes.length,
                index: index,
                quiz: quizzes[index],
                answered: _quizAnswered,
              ),
              const _HintWidget(),
            ],
          );
        },
      ),
    );
  }

  void _quizAnswered({
    required bool isCorrect,
    required bool isLastQuiz,
    required BuildContext context,
  }) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    final scoreBloc = context.read<QuizScoreBloc>();

    if (isCorrect) {
      scoreBloc.add(const QuizScoreEvent.increment());
    }

    // From the specifics of the event loop, we need it to wait for increment
    await Future.delayed(Duration.zero);

    if (isLastQuiz) {
      final score = scoreBloc.state.count ?? 0;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Result(
            score: score,
          ),
        ),
      );
    }
    _pageController.nextPage(
      duration: const Duration(microseconds: 600),
      curve: Curves.easeIn,
    );
  }
}

class _HintWidget extends StatelessWidget {
  const _HintWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ElevatedButton(
          onPressed: () => null,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.withOpacity(0.6)),
          child: const Text(
            'Need hint?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
