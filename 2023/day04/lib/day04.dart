class StretchCard {
  StretchCard(
    this.winningNumbers,
    this.numbers,
  );
  final List<int> winningNumbers;
  final List<int> numbers;

  int get points {
    var points = 0;
    final n = winningNumbers.toSet().intersection(numbers.toSet());
    for (int i = 0; i < n.length; i++) {
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
