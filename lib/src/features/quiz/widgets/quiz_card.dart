import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/app/model/quiz_model.dart';
import 'package:quiz_app/src/core/app/model/quiz_options_model.dart';

class QuizCard extends StatefulWidget {
  const QuizCard({
    required this.quiz,
    required this.index,
    required this.quizzesLength,
    required this.answered,
    super.key,
  });

  final Quiz quiz;
  final int index;
  final int quizzesLength;
  final Function({
    required bool isCorrect,
    required bool isLastQuiz,
    required BuildContext context,
  }) answered;

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  Timer? _timer;
  int _remainingSeconds;
  bool _isVisible;
  bool _isCorrect;
  String _rightAnswer = '';

  _QuizCardState({
    int startSeconds = 40,
    bool isVisible = false,
    bool isCorrect = false,
  })  : _remainingSeconds = startSeconds,
        _isCorrect = isCorrect,
        _isVisible = isVisible;

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingSeconds <= 0) {
        setState(() {
          timer.cancel();
          _isVisible = true;
          _isCorrect = false;
        });
        if (widget.quizzesLength - 1 > widget.index) {
          widget.answered(
            isCorrect: false,
            isLastQuiz: false,
            context: context,
          );
        } else {
          widget.answered(
            isCorrect: false,
            isLastQuiz: true,
            context: context,
          );
        }
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 60,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                _InfoQuizWidget(
                  widget: widget,
                  remainingSeconds: _remainingSeconds,
                ),
                _QuizQuestionWidget(
                  widget: widget,
                ),
                const Spacer(),
                Column(
                  children: widget.quiz.answers.map((quiz) {
                    if (quiz.isCorrect) {
                      setState(() {
                        _rightAnswer = quiz.answer;
                      });
                    }
                    return SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed:
                              _isVisible ? null : () => _nextQuizHelper(quiz),
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 39, 100, 192),
                            ),
                          ),
                          child: Text(quiz.answer),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Opacity(
                  opacity: _isVisible ? 1.0 : 0,
                  child: _Answer(
                    isCorrect: _isCorrect,
                    answer: _rightAnswer,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingSeconds <= 0) {
        setState(() {
          timer.cancel();
          _isVisible = true;
          _isCorrect = false;
        });
        if (widget.length - 1 > widget.index) {
          widget.answered(false, context);
        } else {
          widget.showResult(false, context);
        }
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _nextQuizHelper(QuizAnswer quiz) {
    if (widget.index < widget.quizzesLength - 1) {
      _timer?.cancel();
      setState(() {
        _isVisible = true;
        _isCorrect = quiz.isCorrect;
      });
      widget.answered(
        isCorrect: quiz.isCorrect,
        isLastQuiz: false,
        context: context,
      );
    } else {
      _timer?.cancel();
      setState(() {
        _isVisible = true;
        _isCorrect = quiz.isCorrect;
      });
      widget.answered(
        isCorrect: quiz.isCorrect,
        isLastQuiz: true,
        context: context,
      );
    }
  }
}

class _QuizQuestionWidget extends StatelessWidget {
  const _QuizQuestionWidget({
    super.key,
    required this.widget,
  });

  final QuizCard widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        widget.quiz.question,
        softWrap: true,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}

class _InfoQuizWidget extends StatelessWidget {
  const _InfoQuizWidget({
    super.key,
    required this.widget,
    required int remainingSeconds,
  }) : _remainingSeconds = remainingSeconds;

  final QuizCard widget;
  final int _remainingSeconds;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Question ${widget.index + 1} of ${widget.quizzesLength}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.alarm,
              color: Colors.purple,
            ),
            const SizedBox(
              width: 10,
            ),
            Text('00:${_remainingSeconds.toString().padLeft(2, '0')}'),
          ],
        ),
      ],
    );
  }
}

class _Answer extends StatelessWidget {
  const Answer({
    required this.isCorrect,
    required this.answer,
    super.key,
  });

  final bool isCorrect;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return isCorrect
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.done,
                color: Colors.green,
              ),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Correct! Answer: $answer',
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.close,
                color: Colors.red,
              ),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Incorrect! Answer: $answer',
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
