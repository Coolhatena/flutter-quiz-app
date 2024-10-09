import 'package:flutter/material.dart';
import 'package:quiz_app/question_results.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return QuestionResults(
              questionIndex: (data['question_index'] as int),
              questionText: data['question'] as String,
              userAnswer: data['user_answer'] as String,
              correctAnswer: data['correct_answer'] as String,
            );
          }).toList(),
        ),
      ),
    );
  }
}
