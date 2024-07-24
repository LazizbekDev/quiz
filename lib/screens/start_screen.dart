import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.navigate});
  final void Function() navigate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 330,
          color: const Color.fromARGB(18, 255, 255, 255),
        ),
        const SizedBox(height: 70),
        const Text(
          "Quiz application about flutter",
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        const SizedBox(height: 70),
        OutlinedButton.icon(
          onPressed: () {
            navigate();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.keyboard_double_arrow_right_rounded),
          label: const Text("Start quiz"),
        )
      ],
    );
  }
}
