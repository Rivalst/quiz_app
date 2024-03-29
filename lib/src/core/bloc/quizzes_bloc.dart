import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/src/core/app/data/quiz_repository.dart';
import 'package:quiz_app/src/core/app/model/quiz_model.dart';
import 'package:quiz_app/src/core/util/logger.dart';

part 'quizzes_bloc.freezed.dart';

@freezed
class QuizzesEvent with _$QuizzesEvent {
  const QuizzesEvent._();

  const factory QuizzesEvent.loading() = _LoadingQuizzesEvent;
}

@freezed
class QuizzesState with _$QuizzesState {
  const QuizzesState._();

  List<Quiz>? get quizzes => when<List<Quiz>?>(
        initial: () => null,
        loading: () => null,
        loaded: (quizzes) => quizzes,
        error: (
          quizzes,
          _,
        ) =>
            quizzes,
      );

  const factory QuizzesState.initial() = _InitialQuizzesState;

  const factory QuizzesState.loading() = _LoadingQuizzesState;

  const factory QuizzesState.loaded(List<Quiz> quizzes) = _LoadedQuizzesState;

  const factory QuizzesState.error({
    @Default([]) List<Quiz>? quizzes,
    @Default('Error') String message,
  }) = _ErrorQuizzesState;
}

class QuizBloc extends Bloc<QuizzesEvent, QuizzesState> {
  final QuizRepository _quizRepository;

  QuizBloc({required QuizRepository quizRepository})
      : _quizRepository = quizRepository,
        super(
          const QuizzesState.initial(),
        ) {
    on<QuizzesEvent>(
      (event, emitter) => event.map<Future<void>>(
        loading: (event) => _loading(event, emitter),
      ),
    );
  }

  Future<void> _loading(
    _LoadingQuizzesEvent event,
    Emitter<QuizzesState> emitter,
  ) async {
    try {
      emitter(const QuizzesState.loading());
      final randomQuizzes = await _quizRepository.getRandomStackQuiz();
      // this is required to display the conditional loading indicator
      await Future.delayed(
        const Duration(seconds: 3),
      );
      emitter(
        QuizzesState.loaded(randomQuizzes),
      );
    } catch (e, s) {
      logger.error(e.toString(), stackTrace: s);
      emitter(
        QuizzesState.error(message: e.toString(), quizzes: state.quizzes),
      );
    }
  }
}
