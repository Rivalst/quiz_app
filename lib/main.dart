import 'dart:async';

import 'package:quiz_app/src/core/app/app_runner/app_runner.dart';
import 'package:quiz_app/src/core/util/logger.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () => AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}
