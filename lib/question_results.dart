import 'package:flutter/material.dart';

class QuestionResults extends StatelessWidget {
  const QuestionResults({
    required this.questionIndex,
    required this.questionText,
    required this.userAnswer,
    required this.correctAnswer,
    super.key,
  });

  final int questionIndex;
  final String questionText;
  final String userAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    final Color blueishColor = const Color.fromARGB(255, 33, 185, 255);
    final purplishColor = const Color.fromARGB(255, 207, 43, 236);
    final Color resultColor =
        (userAnswer == correctAnswer) ? blueishColor : purplishColor;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: resultColor,
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(right: 15),
          child: Text(
            (questionIndex + 1).toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                userAnswer,
                style: TextStyle(color: purplishColor, fontSize: 15),
              ),
              Text(
                correctAnswer,
                style: TextStyle(color: blueishColor, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
