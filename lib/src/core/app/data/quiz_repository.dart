import 'package:quiz_app/src/core/app/data/quiz_data.dart';
import 'package:quiz_app/src/core/app/model/quiz_model.dart';

abstract interface class QuizRepository {
  Future<List<Quiz>> getAllQuizzes();
  Future<List<Quiz>> getRandomStackQuiz();
}

class QuizRepositoryImpl implements QuizRepository {
  final QuizDataProvider quizData;
  const QuizRepositoryImpl({
    required this.quizData,
  });

  @override
  Future<List<Quiz>> getAllQuizzes() async {
    final allQuizzes = await quizData.getAllQuizzes();
    return allQuizzes;
  }

  @override
  Future<List<Quiz>> getRandomStackQuiz() async {
    final randomQuizzes = await quizData.getRandomStackQuiz();
    return randomQuizzes;
  }
}
