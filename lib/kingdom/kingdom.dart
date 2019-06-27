library kingdom;

import 'package:ttk_chess/game/location.dart';
import 'package:ttk_chess/role/role.dart';

part 'kingdom_wei.dart';

abstract class Kingdom {
  String kingdomName;
  int color;
  List<Role> roles;

  bool canRoleMoveTo(Role role, Location location);
}