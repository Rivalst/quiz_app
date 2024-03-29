import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/src/core/app/data/quiz_data.dart';
import 'package:quiz_app/src/core/app/data/quiz_repository.dart';

void main() {
  test('Need get array of random quiz from repository', ()  async {
     final quizDataProvider = QuizDataProviderImpl();
     final quizRepository = QuizRepositoryImpl(quizData: quizDataProvider); 

     final firstRandomQuiz = await quizRepository.getRandomStackQuiz();

     expect(firstRandomQuiz.length, 15);

     final secondRandomQuiz = await quizRepository.getRandomStackQuiz();

     expect(secondRandomQuiz.length, 15);
     expect(secondRandomQuiz != firstRandomQuiz, true);
  });
}