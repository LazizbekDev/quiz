import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/screens/quiz_screen.dart';
import 'package:quizz/screens/result_screen.dart';
import 'package:quizz/screens/start_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(navigate: switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          navigate: switchScreen,
          chosenAnswers: selectedAnswers,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      selectedAnswers = [];

      activeScreen = QuizScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 57, 18, 135),
              Color.fromARGB(255, 87, 11, 153),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
