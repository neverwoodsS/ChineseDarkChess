
import 'dart:async';

import 'package:ttk_chess/game/game.dart';
import 'package:ttk_chess/game/location.dart';
import 'package:ttk_chess/role/role.dart';

void main() {
//  testRoute();
  testGame();
}

testRoute() {
  var startLocation = Location(0, 0);

  var soldier = Soldier()
    ..location = startLocation
  ;
  assert(null == soldier.routeTo(Location(0, 2)));
  assert(null == soldier.routeTo(Location(1, 1)));
  assert(null == soldier.routeTo(Location(2, 0)));
  assert(null != soldier.routeTo(Location(0, 1)));
  assert(null != soldier.routeTo(Location(1, 0)));

  var king = King("")
    ..location = startLocation
  ;
  assert(null == king.routeTo(Location(0, 2)));
  assert(null == king.routeTo(Location(1, 1)));
  assert(null == king.routeTo(Location(2, 0)));
  assert(null != king.routeTo(Location(0, 1)));
  assert(null != king.routeTo(Location(1, 0)));

  var knight = Knight()
    ..location = startLocation
  ;
  assert(null == knight.routeTo(Location(0, 0)));
  assert(null == knight.routeTo(Location(1, 0)));
  assert(null == knight.routeTo(Location(0, 1)));
  assert(null == knight.routeTo(Location(1, 1)));
  assert(null != knight.routeTo(Location(1, 2)));
  assert(null != knight.routeTo(Location(2, 1)));

  var minister = Minister()
    ..location = startLocation
  ;
  assert(null == minister.routeTo(Location(0, 0)));
  assert(null == minister.routeTo(Location(1, 0)));
  assert(null == minister.routeTo(Location(0, 1)));
  assert(null == minister.routeTo(Location(1, 1)));
  assert(null == minister.routeTo(Location(1, 2)));
  assert(null == minister.routeTo(Location(2, 1)));
  assert(null != minister.routeTo(Location(2, 2)));

  var guard = Guard()
    ..location = startLocation
  ;
  assert(null == guard.routeTo(Location(0, 0)));
  assert(null == guard.routeTo(Location(0, 1)));
  assert(null == guard.routeTo(Location(1, 0)));
  assert(null != guard.routeTo(Location(1, 1)));

  var rook = Rook()
    ..location = startLocation
  ;
  assert(null == rook.routeTo(Location(0, 0)));
  assert(null == rook.routeTo(Location(1, 1)));
  assert(3 == rook.routeTo(Location(4, 0)).length);
  assert(5 == rook.routeTo(Location(0, 6)).length);

  var cannon = Cannon()
    ..location = startLocation
  ;
  assert(null == cannon.routeTo(Location(0, 0)));
  assert(null == cannon.routeTo(Location(1, 1)));
  assert(6 == cannon.routeTo(Location(7, 0)).length);
  assert(8 == cannon.routeTo(Location(0, 9)).length);
}

testGame() async {
  Game game = Game();

  await Future.delayed(const Duration(seconds: 2), () => "2");
  game.clickOnLocation(Location(11, 14));

  await Future.delayed(const Duration(seconds: 2), () => "2");
  game.clickOnLocation(Location(11, 0));
}