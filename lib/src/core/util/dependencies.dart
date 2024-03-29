import 'package:quiz_app/src/core/app/data/quiz_repository.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  const Dependencies({required this.quizRepository});

  /// [QuizRepository] instance, used to get quizzes
  final QuizRepository quizRepository;
}

/// {@template initialization_result}
/// Result of initialization
/// {@endtemplate}
final class InitializationResult {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
