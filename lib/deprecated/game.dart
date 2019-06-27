import 'dart:math';
import 'mode.dart';
import 'package:ttk_chess/deprecated/role.dart';
import 'package:ttk_chess/game/location.dart';

class Game {

  static Game shuffle(Mode mode) {
    List<Role> roles = [];

    for (bool side in [false, true]) {
      roles.add(Pawn()..side = side);
      roles.add(Pawn()..side = side);
      roles.add(Pawn()..side = side);
      roles.add(Pawn()..side = side);
      roles.add(Pawn()..side = side);

      roles.add(Castle()..side = side);
      roles.add(Castle()..side = side);

      roles.add(Knight()..side = side);
      roles.add(Knight()..side = side);

      roles.add(Turret()..side = side);
      roles.add(Turret()..side = side);

      roles.add(Bishop()..side = side);
      roles.add(Bishop()..side = side);

      roles.add(Guard()..side = side);
      roles.add(Guard()..side = side);

      roles.add(King()..side = side);
    }

    roles.shuffle(Random());

    return Game()
      ..insertRolesAndHide(roles)
      ..mode = mode
    ;
  }

  var mode = Mode.NORMAL;

  List<List<Role>> roles = [
    [null, null, null, null],
    [null, null, null, null],
    [null, null, null, null],
    [null, null, null, null],
    [null, null, null, null],
    [null, null, null, null],
    [null, null, null, null],
  ];

  void insertRolesAndHide(List<Role> roles) {
    assert(roles.length == 32);
    for (int i = 0; i < roles.length; i++) {
      Role role = roles[i];
      int x = i % 8;
      int y = i ~/ 8;
      this.roles[x][y] = role
        ..hide = true
        ..location = Location(x, y)
      ;
    }
  }

  List<Role> _getRolesByX(int x) {
    List<Role> res = List(4);
    for (int y in [0, 1, 2, 3]) {
      res[y] = roles[x][y];
    }
    return res;
  }

  List<Role> _getRolesByY(int y) {
    List<Role> res = List(8);
    for (int x in [0, 1, 2, 3, 4, 5, 6, 7]) {
      res[x] = roles[x][y];
    }
    return res;
  }

  int countBetween(Location l1, Location l2) {
    // 不在一条直线上
    if (l1.x != l2.x && l1.y != l2.y) {
       return -1;
    }

    // 在同一 x 轴上
    if (l1.x == l2.x) {
      int min = l1.y > l2.y ? l2.y : l1.y;
      int max = l1.y + l2.y - min;

      int count = 0;
      var source = _getRolesByX(l1.x).sublist(min + 1, max);
      for (Role role in source) {
        if (role != null) count++;
      }

      return count;
    }

    // 在同一 y 轴上
    if (l1.y == l2.y) {
      int min = l1.x > l2.x ? l2.x : l1.x;
      int max = l1.x + l2.x - min;

      int count = 0;
      var source = _getRolesByY(l1.y).sublist(min + 1, max);
      for (Role role in source) {
        if (role != null) count++;
      }

      return count;
    }

    return 0;
  }

  void addRoleToLocation(Role role, Location location) {
    roles[location.x][location.y] = role;
    role.location = location;
  }
}