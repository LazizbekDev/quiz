import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/widgets/question_sumrary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() navigate;
  final List<String> chosenAnswers;
  const ResultScreen(
      {super.key, required this.navigate, required this.chosenAnswers});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> sumrary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      sumrary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].variants[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return sumrary;
  }

  @override
  Widget build(BuildContext context) {
    final totolQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $correctAnswers out of $totolQuestions questions correctly!",
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSumrary(summaryData: summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  navigate();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.replay),
                    Text("Restart"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
