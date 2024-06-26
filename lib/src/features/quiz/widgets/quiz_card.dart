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
  bool _isAnswered;
  bool _isCorrect;
  String _rightAnswer = '';

  _QuizCardState({
    int startSeconds = 40,
    bool isVisible = false,
    bool isCorrect = false,
  })  : _remainingSeconds = startSeconds,
        _isCorrect = isCorrect,
        _isAnswered = isVisible;

  @override
  void initState() {
    super.initState();
    _startCountdown();
    _getRightAnswer();
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
                  children: widget.quiz.answers.map((quizAnswer) {
                    return _AnswerButton(
                      answer: quizAnswer.answer,
                      onPressed: () => _nextQuizHelper(quizAnswer),
                      isAnswered: _isAnswered,
                    );
                  }).toList(),
                ),
                Opacity(
                  opacity: _isAnswered ? 1.0 : 0,
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
          _isAnswered = true;
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

  void _getRightAnswer() {
    for (var answer in widget.quiz.answers) {
      if (answer.isCorrect) {
        setState(() {
          _rightAnswer = answer.answer;
        });
        break;
      }
    }
  }

  void _nextQuizHelper(QuizAnswer quiz) {
    if (widget.index < widget.quizzesLength - 1) {
      _timer?.cancel();
      setState(() {
        _isAnswered = true;
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
        _isAnswered = true;
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
  const _Answer({
    required this.isCorrect,
    required this.answer,
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

class _AnswerButton extends StatefulWidget {
  final String answer;
  final Function onPressed;
  final bool isAnswered;

  const _AnswerButton({
    required this.answer,
    required this.onPressed,
    required this.isAnswered,
  });

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<_AnswerButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          onPressed: widget.isAnswered
              ? () => null
              : () {
                  setState(() {
                    _isSelected = true;
                  });
                  widget.onPressed();
                },
          style: ElevatedButton.styleFrom(
              side: const BorderSide(
                width: 2.0,
                color: Colors.deepPurple,
              ),
              backgroundColor: _isSelected ? Colors.deepPurple : Colors.white,
              foregroundColor: _isSelected ? Colors.white : Colors.deepPurple,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white),
          child: Text(widget.answer),
        ),
      ),
    );
  }
}
