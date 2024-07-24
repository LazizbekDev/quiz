import 'package:flutter/material.dart';

class QuestionSumrary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSumrary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: data['correct_answer'] == data['user_answer']
                            ? [
                                const Color.fromARGB(255, 102, 255, 179),
                                const Color.fromARGB(255, 80, 254, 167)
                              ]
                            : [
                                const Color.fromARGB(255, 255, 148, 102),
                                const Color.fromARGB(255, 255, 127, 72)
                              ],
                      ),
                    ),
                    width: 30,
                    height: 30,
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 102, 255, 179),
                          ),
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: TextStyle(
                            color: data['correct_answer'] == data['user_answer']
                                ? const Color.fromARGB(255, 102, 255, 179)
                                : const Color.fromARGB(255, 255, 148, 102),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
