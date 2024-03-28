import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/common/util/bloc_observ.dart';
import 'package:quiz_app/src/common/util/init.dart';
import 'package:quiz_app/src/common/util/logger.dart';
import 'package:quiz_app/src/features/app/widgets/app.dart';
import 'package:quiz_app/src/features/app/widgets/app_error.dart';

class AppRunner {
  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    binding.deferFirstFrame();

    // Override logging
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError =
        logger.logPlatformDispatcherError;

    // Setup bloc observer and transformer
    Bloc.observer = const AppBlocObserver();

    Future<void> initializeAndRun() async {
      try {
        final result = await const InitializationProcessor().initialize();
        runApp(App(
          result: result,
        ));
      } catch (e, stackTrace) {
        logger.error('Initialization failed', error: e, stackTrace: stackTrace);
        //TODO: NEED CHECK
        runApp(
          const InitializationFailedApp(
              // error: e,
              // stackTrace: stackTrace,
              // retryInitialization: initializeAndRun,
              ),
        );
      } finally {
        // Allow rendering
        binding.allowFirstFrame();
      }
    }

    // Run the app
    await initializeAndRun();
  }
}
