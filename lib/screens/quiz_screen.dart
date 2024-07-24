import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuizScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  void questionChanger(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuesion = questions[currentIndex];
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuesion.text,
                style: GoogleFonts.firaCode(
                    color: const Color.fromARGB(159, 255, 255, 255),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuesion.shuffledAnswers.map((answer) {
                return AnswerButton(
                  text: answer,
                  onPress: () {
                    questionChanger(answer);
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
