import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_app/src/core/bloc/quizzes_bloc.dart';
import 'package:quiz_app/src/core/util/dependencies.dart';
import 'package:quiz_app/src/core/widgets/root.dart';

class App extends StatelessWidget {
  final InitializationResult result;

  const App({
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        quizRepository: result.dependencies.quizRepository,
      )..add(
          const QuizzesEvent.loading(),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const Root(),
      ),
    );
  }
}
