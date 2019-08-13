library control;

import 'dart:async';
import 'package:ttk_chess/game/game.dart';
import 'package:ttk_chess/game/intersection.dart';
import 'package:ttk_chess/kingdom/kingdom.dart';

part 'control_waiting.dart';
part 'control_thingking.dart';
part 'control_picked.dart';
part 'control_submit.dart';

abstract class Control {
  Kingdom kingdom;
  Game game;
  Control(this.kingdom, this.game);

  void clickAtIntersection(Intersection intersection);
  void movingKingdomChange(Kingdom movingKingdom);
  Future<Control> process();

  Completer _completer = Completer();
}