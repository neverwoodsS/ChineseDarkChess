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
  /// 可以是文字，也可以是图片资源
  /// 取决于显示实现方案
  var res;

  Kingdom kingdom;
  Location location;
  final acceptableBlockCount = 0;

  bool _canMoveTo(Location targetLocation);

  /// 返回 null 则为不可达
  /// 非 null 则可达，但仍需其他检查
  /// 例如终点是否有友军，相士兵的移动限制等
  List<Location> routeTo(Location targetLocation);
}