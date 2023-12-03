class Engine {
  List<String> lines;
  List<EnginePart> parts = [];

  Engine.fromData(this.lines);

  void evaluate() {
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final regex = RegExp(r'(\d+)');
      final matches = regex.allMatches(line);

      for (final match in matches) {
        final (top, left, right, bottom) =
            getAdjacentSymbols(i, match.start, match.end);
        // print('top: $top,\n left: $left,\n right: $right,\n bottom: $bottom');
        parts.add(EnginePart(
          int.parse(match.group(0)!),
          i,
          match.start,
          match.end,
          top,
          left,
          right,
          bottom,
        ));
      }
    }

    var result = 0;
    for (final part in parts) {
      if (part.isPart) {
        print(part);
        result += part.value;
      }
    }
    print(result);
  }

  (String, String, String, String) getAdjacentSymbols(
    int row,
    int columnStart,
    int columnEnd,
  ) {
    final line = lines[row];

    final previousLine = row > 0 ? lines[row - 1] : '';
    final nextLine = row < lines.length - 1 ? lines[row + 1] : '';

    final indexStart = columnStart > 0 ? columnStart - 1 : 0;
    final indexEnd =
        columnEnd + 1 < line.length - 1 ? columnEnd + 1 : line.length - 1;

    final top = previousLine.isNotEmpty
        ? previousLine.substring(indexStart, indexEnd)
        : '';
    final bottom =
        nextLine.isNotEmpty ? nextLine.substring(indexStart, indexEnd) : '';

    return (
      top,
      columnStart > 0 ? line.substring(columnStart - 1, columnStart) : '',
      columnEnd + 1 < line.length - 1
          ? line.substring(columnEnd, columnEnd + 1)
          : '',
      bottom
    );
  }
}

///
class EnginePart {
  EnginePart(
    this.value,
    this.rowIndex,
    this.columnStart,
    this.columnEnd,
    this.top,
    this.left,
    this.right,
    this.bottom,
  );
  int value;
  int rowIndex;
  int columnStart;
  int columnEnd;
  final String top;
  final String left;
  final String right;
  final String bottom;

  bool get isPart => '$top$left$right$bottom'.replaceAll('.', '').isNotEmpty;

  @override
  String toString() {
    return 'EnginePart{value: $value,\n rowIndex: $rowIndex,\n columnStart: $columnStart,\n columnEnd: $columnEnd,\n top: $top,\n left: $left,\n right: $right,\n bottom: $bottom}';
  }
}
