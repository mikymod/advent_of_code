import 'dart:convert';
import 'dart:io';

import 'package:day03/day03.dart';

void main(List<String> arguments) async {
  final file = File('input.txt');
  final lines = await file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter())
      .toList(); // Convert stream to individual lines.
  try {
    part1(lines);
    // part2(lines);
  } catch (e) {
    print('Error: $e');
  }
}

void part1(List<String> lines) {
  final engine = Engine.fromData(lines);
  engine.evaluate();
}
