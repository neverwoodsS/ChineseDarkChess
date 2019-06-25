import 'package:chinese_dark_chess/deprecated/game.dart';
import 'package:chinese_dark_chess/deprecated/location.dart';
import 'package:chinese_dark_chess/deprecated/mode.dart';
import 'package:chinese_dark_chess/deprecated/role.dart';

void main() {
  Game game = Game.shuffle(Mode.NORMAL);

  for (List<Role> roles in game.roles) {
    print("\n");

    var sb = StringBuffer();
    for (Role role in roles) {
      sb.write(role.getLabel());
    }

    print(sb.toString());
  }

//  game.rule = 1;
//
//  Role r1 = Turret();
//  game.addRoleToLocation(r1, Location(0, 2));
//
//  Role r2 = Pawn();
//  game.addRoleToLocation(r2, Location(3, 2));
//
//  Role r3 = Pawn();
//  r3.side = true;
//  r3.hide = false;
//  game.addRoleToLocation(r3, Location(2, 2));
//
//  Role r4 = King();
//  r4.side = false;
//  r4.hide = false;
//  game.addRoleToLocation(r4, Location(1, 2));
//
//  print(r1.canEat(r2, game));
//  print(r3.canEat(r4, game));
//  print(r4.canEat(r3, game));
}