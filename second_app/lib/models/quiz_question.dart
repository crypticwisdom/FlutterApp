class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledList() {
    // final ensures that the 'shuffledList' cannot be re-assigned a value.
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
