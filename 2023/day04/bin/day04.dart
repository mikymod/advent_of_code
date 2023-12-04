import 'dart:convert';
import 'dart:io';

import 'package:day04/day04.dart';

void main(List<String> arguments) async {
  final file = File('input.txt');
  final lines = await file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter())
      .toList();

  final cards = <StretchCard>[];
  for (final line in lines) {
    final winningNumbersStr = line.split(':')[1].split('|')[0];
    final numbersStr = line.split(':')[1].split('|')[1];

    final regexp = RegExp(r'(\d+)');
    final winningNumbers = regexp
        .allMatches(winningNumbersStr)
        .map((m) => int.parse(m.group(0)!))
        .toList();
    final numbers = regexp
        .allMatches(numbersStr)
        .map((m) => int.parse(m.group(0)!))
        .toList();

    cards.add(StretchCard(winningNumbers, numbers));
  }

  var points = 0;
  for (final card in cards) {
    points += card.points;
  }
  print(points);
}
