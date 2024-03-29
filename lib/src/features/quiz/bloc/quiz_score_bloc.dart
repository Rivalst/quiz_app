import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_score_bloc.freezed.dart';

@freezed
class QuizScoreState with _$QuizScoreState {
  const QuizScoreState._();

  int? get count => when<int?>(
        initial: (score) => score,
      );

  factory QuizScoreState.initial({@Default(0) int score}) = _$InitialScoreState;
}

@freezed
class QuizScoreEvent with _$QuizScoreEvent {
  const factory QuizScoreEvent.increment() = _IncrementScoreEvent;
}

class QuizScoreBloc extends Bloc<QuizScoreEvent, QuizScoreState> {
  QuizScoreBloc() : super(QuizScoreState.initial()) {
    on<QuizScoreEvent>((event, emitter) {
      event.map(
        increment: (_) => emitter(
          state.copyWith(
            score: state.score + 1,
          ),
        ),
      );
    });
  }
}
