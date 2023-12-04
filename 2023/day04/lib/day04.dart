class StretchCard {
  StretchCard(
    this.winningNumbers,
    this.numbers,
  );
  final List<int> winningNumbers;
  final List<int> numbers;
  int instances = 1;

  int get matchingNumbers =>
      winningNumbers.toSet().intersection(numbers.toSet()).length;

  int get points {
    var points = 0;
    for (int i = 0; i < matchingNumbers; i++) {
      if (i == 0) {
        points = 1;
      } else if (i > 0) {
        points *= 2;
      }
    }
    return points;
  }

  @override
  String toString() {
    return 'StretchCard{winningNumbers: $winningNumbers, numbers: $numbers}';
  }
}
