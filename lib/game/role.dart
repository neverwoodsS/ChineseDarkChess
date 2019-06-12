import 'package:chinese_dark_chess/game/game.dart';
import 'package:chinese_dark_chess/game/location.dart';
import 'package:chinese_dark_chess/game/mode.dart';

abstract class Role {

  /// 是否已经翻开
  /// true 没翻开
  /// false 已翻开
  bool hide = true;

  /// 所属阵营 true or false
  bool side;

  /// 战斗力
  int _power;

  /// 棋子所属位置
  Location location;

  /// 棋子在黑方的名字
  String labelBlack;

  /// 棋子在红方的名字
  String labelRed;

  /// 综合判定是否能吃子
  /// 包含：
  /// 1.目标是否翻开
  /// 2.目标是否是同一阵营
  /// 3.打不打得过
  /// 4.能否移动到目标位置
  bool canEat(Role another, Game game) {
    // 还没翻开的棋子
    if (another.hide) return false;

    // 同一阵营
    if (side == another.side) return false;

    // 打不过对方
    if (!_canWin(another)) return false;

    // 不能移动到对方的位置
    if (!_canMove(another.location)) return false;

    return true;
  }

  /// 仅判断是否打的过
  bool _canWin(Role another) => _power >= another._power;

  /// 仅判断是否能移动到指定位置
  bool _canMove(Location anotherLocation) => (location.x - anotherLocation.x).abs() + (location.y - anotherLocation.y).abs() == 1;

  String getLabel() => side ? labelRed : labelBlack;
}

class Pawn extends Role {
  @override
  final int _power = 1;

  @override
  final String labelBlack = '卒';

  @override
  final String labelRed = '兵';

  @override
  bool _canWin(Role another) {
    // 通过取7的余数，可以实现除了将帅(7)谁都打不过的效果
    return _power % 7 >= another._power % 7;
  }
}

class Turret extends Role {
  @override
  final int _power = 2;

  @override
  final String labelBlack = '砲';

  @override
  final String labelRed = '炮';

  @override
  bool canEat(Role another, Game game) {
    // 暗杀模式
    if (game.mode == Mode.KILL) {
      // 此模式下只有翻开的，且是同阵营的不能攻击
      if (!another.hide && side == another.side) return false;
    }
    // 普通模式需同时检查翻开状态和阵营
    else if (another.side == null || side == another.side) return false;

    // 不在一条直线上
    if (another.location.x != location.x && another.location.y != location.y) return false;

    // 检查中间间隔棋子数量
    int count = game.countBetween(this.location, another.location);
    if (count != 1) return false;

    return true;
  }

  /// 炮塔不吃子不能动
  @override
  bool _canMove(Location anotherLocation) => false;
}

class Knight extends Role {
  @override
  final int _power = 3;

  @override
  final String labelBlack = '傌';

  @override
  final String labelRed = '馬';
}

class Castle extends Role {
  @override
  final int _power = 4;

  @override
  final String labelBlack = '俥';

  @override
  final String labelRed = '車';
}

class Bishop extends Role {
  @override
  final int _power = 5;

  @override
  final String labelBlack = '象';

  @override
  final String labelRed = '相';
}

class Guard extends Role {
  @override
  final int _power = 6;

  @override
  final String labelBlack = '仕';

  @override
  final String labelRed = '士';
}

class King extends Role {
  @override
  final int _power = 7;

  @override
  final String labelBlack = '将';

  @override
  final String labelRed = '帅';

  /// 除了兵卒(1)，谁都打的过
  @override
  bool _canWin(Role another) => another._power != 1;
}