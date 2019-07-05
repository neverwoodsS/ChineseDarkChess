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

  Kingdom ally;

  bool canRoleMoveTo(Role startRole, Role targetRole, Location targetLocation, List<Location> route) {
    final blockCount = game.countBlockOfRoute(route);

    // 目标位置没有棋子
    // 一定需要路径没有阻碍
    if (targetRole == null)
      return blockCount == 0;

    // 检查目标位置棋子所属势力
    // 如果是己方、盟友则不可移动
    if (targetRole.kingdom == this || targetRole.kingdom == ally)
      return false;

    // 如果是敌对势力
    // 需要路径阻碍数符合棋子自身要求
    // 例如：炮（1），其余（0）
    return blockCount == startRole.acceptableBlockCount;
  }
}