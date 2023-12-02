class Calibration {
  Calibration.fromLines(String line) {
    RegExp exp = RegExp(r'(\d)');
    Iterable<Match> matches = exp.allMatches(line);
    first = matches.isNotEmpty ? matches.first[0]! : null;
    last = matches.length > 1 ? matches.last[0]! : matches.first[0]!;
  }

  String? first;
  String? last;

  int get value => int.tryParse("${first ?? ''}${last ?? ''}") ?? 0;

  @override
  String toString() {
    return 'Calibration{first: $first, last: $last}';
  }
}

class CalibrationEx {
  static const Map<String, String> _map = {
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9'
  };

  String? first;
  String? last;

  CalibrationEx.fromLine(String line) {
    RegExp exp = RegExp(
        r'(\d)|(one)|(two)|(three)|(four)|(five)|(six)|(seven)|(eight)|(nine)');
    Iterable<Match> matches = exp.allMatches(line);

    _map.containsKey(matches.first[0])
        ? first = _map[matches.first[0]]
        : first = matches.first[0]!;

    _map.containsKey(matches.last[0])
        ? last = _map[matches.last[0]]
        : last = matches.last[0]!;
  }

  int get value => int.tryParse("${first ?? ''}${last ?? ''}") ?? 0;

  @override
  String toString() {
    return 'Calibration{first: $first, last: $last}';
  }
}
