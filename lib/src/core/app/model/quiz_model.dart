import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/src/core/app/model/quiz_options_model.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz(
      {required String question, required List<QuizAnswer> answers}) = _Quiz;

  factory Quiz.fromJson(Map<String, Object?> json) => _$QuizFromJson(json);
}
