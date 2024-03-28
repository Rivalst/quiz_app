import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_options_model.freezed.dart';
part 'quiz_options_model.g.dart';

@freezed
class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    required String answer,
    required bool isCorrect,
  }) = _QuizAnswer;

  factory QuizAnswer.fromJson(Map<String, Object?> json) =>
      _$QuizAnswerFromJson(json);
}
