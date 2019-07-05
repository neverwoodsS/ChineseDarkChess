library role;

import 'package:ttk_chess/kingdom/kingdom.dart';
import 'package:ttk_chess/game/location.dart';

part 'role_soldier.dart';
part 'role_king.dart';
part 'role_rook.dart';
part 'role_knight.dart';
part 'role_minister.dart';
part 'role_guard.dart';
part 'role_cannon.dart';

abstract class Role {
  final acceptableBlockCount = 0;

  /// 可以是文字，也可以是图片资源
  /// 取决于显示实现方案
  var res;

  Kingdom kingdom;
  Location location;
  bool died;

  bool _canMoveTo(Location targetLocation);

  /// 返回 null 则为不可达
  /// 非 null 则可达，但仍需其他检查
  /// 例如终点是否有友军，相士兵的移动限制等
  List<Location> routeTo(Location targetLocation);

  bool canMoveTo(Location location, Role role) {
    final route = routeTo(location);

    // 路径不可达直接判定失败
    if (route == null)
      return false;

    // 路径可达，交由 kingdom 判断
    return kingdom.canRoleMoveTo(this, role, location, route);
  }
}