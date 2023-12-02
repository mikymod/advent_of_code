import 'dart:convert';
import 'dart:io';

import 'package:day02/day02.dart';

Future<void> main(List<String> arguments) async {
  final file = File('input.txt');
  final lines = await file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter())
      .toList(); // Convert stream to individual lines.
  try {
    part1(lines);
    part2(lines);
  } catch (e) {
    print('Error: $e');
  }
}

/// Evaluate the sum of all possible games.
void part1(List<String> lines) async {
  var result = 0;

  for (var line in lines) {
    final game = Game.fromData(line);
    if (game.possible) {
      result += int.parse(game.id!);
    }
  }
  print('Part 1: $result');
}

/// Evaluate the sum of power of all games.
/// The power of a game is the product of the maximum power of each color.
void part2(List<String> lines) async {
  var result = 0;

  for (var line in lines) {
    final game = Game.fromData(line);
    result += game.power;
  }

  print('Part 2: $result');
}
