library Surprise;

import 'dart:html';
import 'dart:math';

part "game.dart";

part "world/world.dart";
part "world/dungeon.dart";
part "world/mission.dart";
part "world/battle.dart";

part "town/town.dart";

part "creatures/creature.dart";
part "creatures/species.dart";
part "creatures/statistic.dart";

part "heroes/hero.dart";
part "heroes/roster.dart";
part "heroes/party.dart";

part "enemies/enemy.dart";

Game theGame;

void main() {
	theGame = new Game();

	theGame.start();
}
