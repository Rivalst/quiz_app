import 'dart:async';

import 'package:quiz_app/src/common/util/helpers.dart';
import 'package:quiz_app/src/features/app/model/quiz_model.dart';

abstract interface class QuizDataProvider {
  Future<List<Quiz>> getAllQuizzes();
  Future<List<Quiz>> getRandomStackQuiz();
}

class QuizDataProviderImpl implements QuizDataProvider {
  @override
  Future<List<Quiz>> getAllQuizzes() async {
    // completer for simulate future
    final completer = Completer<List<Quiz>>();

    final allQuizzes = _quizFromJson(quizJsonHelper);
    completer.complete(allQuizzes);

    return completer.future;
  }

  @override
  Future<List<Quiz>> getRandomStackQuiz() {
    // completer for simulate future
    final completer = Completer<List<Quiz>>();
    final allQuizzes = _quizFromJson(quizJsonHelper);

    // there is we shuffle own quiz
    allQuizzes.shuffle();

    // there we take only 15 quiz
    final randomQuizzes = allQuizzes.take(15).toList();

    completer.complete(randomQuizzes);

    return completer.future;
  }

  List<Quiz> _quizFromJson(Set<Map<String, Object>> quizzes) {
    final List<Quiz> allQuizzes = [];
    for (var quiz in quizJsonHelper) {
      final quizFromJson = Quiz.fromJson(quiz);
      allQuizzes.add(quizFromJson);
    }

    return allQuizzes;
  }
}
