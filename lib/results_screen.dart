import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.choosenAnswers, required this.restartQuiz, super.key});

  final List<String> choosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          QuestionsSummary(summaryData: summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 17)),
            onPressed: restartQuiz,
            icon: const Icon(
              Icons.refresh_sharp,
            ),
            label: const Text(
              'Restart Quiz!',
            ),
          )
        ],
      ),
    );
  }
}
