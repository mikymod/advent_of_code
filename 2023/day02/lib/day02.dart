import 'package:collection/collection.dart';

/// A class the represents a game.
class Game {
  String? id;
  List<Session> sessions = [];

  Game.fromData(String line) {
    id = line.split(':')[0].split(' ')[1];
    final sessionsPerGame = line.split(':')[1].split(';');
    for (final session in sessionsPerGame) {
      final cubes = session.trim().split(',');
      sessions.add(Session([
        for (final cube in cubes)
          Cube(int.parse(cube.trim().split(' ')[0]), cube.trim().split(' ')[1])
      ]));
    }
  }

  bool get possible {
    for (final session in sessions) {
      for (final cube in session.cubes) {
        if (!cube.possible) {
          return false;
        }
      }
    }
    return true;
  }

  int get power {
    final maxRed = sessions
        .reduce((value, element) =>
            value.redPower > element.redPower ? value : element)
        .redPower;
    final maxGreen = sessions
        .reduce((value, element) =>
            value.greenPower > element.greenPower ? value : element)
        .greenPower;
    final maxBlue = sessions
        .reduce((value, element) =>
            value.bluePower > element.bluePower ? value : element)
        .bluePower;

    return maxRed * maxGreen * maxBlue;
  }
}

/// A class that represents a single session in a game.
class Session {
  Session(this.cubes);

  final List<Cube> cubes;

  int get redPower =>
      cubes.firstWhereOrNull((value) => value.color == 'red')?.num ?? 0;
  int get greenPower =>
      cubes.firstWhereOrNull((value) => value.color == 'green')?.num ?? 0;
  int get bluePower =>
      cubes.firstWhereOrNull((value) => value.color == 'blue')?.num ?? 0;
}

/// A class that represents a cube.
class Cube {
  Cube(this.num, this.color);

  final int num;
  final String color;

  static const maxRedCubes = 12;
  static const maxGreenCubes = 13;
  static const maxBlueCubes = 14;

  bool get possible {
    switch (color) {
      case 'red':
        return num <= maxRedCubes;
      case 'green':
        return num <= maxGreenCubes;
      case 'blue':
        return num <= maxBlueCubes;
      default:
        print('Error: Unknown color');
        return false;
    }
  }
}
