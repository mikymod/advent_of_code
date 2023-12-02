import 'dart:convert';
import 'dart:io';

import 'package:day01/day01.dart';

void main(List<String> arguments) async {
  final file = File('input.txt');
  final lines = await file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter())
      .toList(); // Convert stream to individual lines.

  part1(lines);
  part2(lines);
}

void part1(List<String> lines) {
  var result = 0;
  for (var line in lines) {
    final calibration = Calibration.fromLines(line);
    final value = calibration.value;
    result += value;
  }
  print('Part 1: $result');
}

void part2(List<String> lines) {
  var result = 0;
  for (var line in lines) {
    final calibration = CalibrationEx.fromLine(line);
    final value = calibration.value;
    result += value;
  }
  print('Part 2: $result');
}
