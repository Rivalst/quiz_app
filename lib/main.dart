import 'dart:async';

import 'package:quiz_app/src/common/util/logger.dart';
import 'package:quiz_app/src/features/app/app_runner/app_runner.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () => AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}
