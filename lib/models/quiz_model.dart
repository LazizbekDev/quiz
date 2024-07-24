class QuizModel {
  final String text;
  final List<String> variants;
  QuizModel({required this.text, required this.variants});

  List<String> get shuffledAnswers {
    final shuffledList = List.of(variants);
    shuffledList.shuffle();
    return shuffledList;
  }
}
