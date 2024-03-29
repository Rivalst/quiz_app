import 'package:quiz_app/src/core/app/data/quiz_data.dart';
import 'package:quiz_app/src/core/app/data/quiz_repository.dart';
import 'package:quiz_app/src/core/util/dependencies.dart';
import 'package:quiz_app/src/core/util/logger.dart';

/// {@template initialization_processor}
/// A class which is responsible for processing initialization steps.
/// {@endtemplate}
final class InitializationProcessor {
  /// {@macro initialization_processor}
  const InitializationProcessor();

  Future<Dependencies> _initDependencies() async {
    final quizData = QuizDataProviderImpl();
    final quizRepository = QuizRepositoryImpl(quizData: quizData);

    return Dependencies(
      quizRepository: quizRepository,
    );
  }

  /// Method that starts the initialization process
  /// and returns the result of the initialization.
  ///
  /// This method may contain additional steps that need initialization
  /// before the application starts
  /// (for example, caching or enabling tracking manager)
  Future<InitializationResult> initialize() async {
    final stopwatch = Stopwatch()..start();

    logger.info('Initializing dependencies...');
    // initialize dependencies
    final dependencies = await _initDependencies();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = InitializationResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }
}
