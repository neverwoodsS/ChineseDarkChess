library kingdom;

import 'package:ttk_chess/game/game.dart';
import 'package:ttk_chess/game/location.dart';
import 'package:ttk_chess/role/role.dart';

part 'kingdom_wei.dart';
part 'kingdom_shu.dart';
part 'kingdom_wu.dart';

abstract class Kingdom {
  Game game;
  String kingdomName;
  int color;
  List<Role> roles;

  bool canRoleMoveTo(Role role, Location location);
}