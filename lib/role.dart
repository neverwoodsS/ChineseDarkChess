import 'package:chinese_dark_chess/game.dart';
import 'package:chinese_dark_chess/location.dart';

abstract class Role {

  /// 是否已经翻开
  /// true 没翻开
  /// false 已翻开
  bool hide = true;

  /// 所属阵营 true or false
  bool side;

  /// 战斗力
  int power;

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

    // 可移动到对方的位置
    var distance = (location.x - another.location.x).abs() + (location.y - another.location.y).abs();
    if (distance > 1) return false;

    return true;
  }

  /// 仅判断是否打的过
  bool _canWin(Role another) => power >= another.power;
}

class Pawn extends Role {
  @override
  final int power = 1;

  @override
  final String labelBlack = '卒';

  @override
  final String labelRed = '兵';

  @override
  bool _canWin(Role another) {
    // 通过取7的余数，可以实现除了将帅(7)谁都打不过的效果
    return power % 7 >= another.power % 7;
  }
}

class Turret extends Role {
  @override
  final int power = 2;

  @override
  final String labelBlack = '砲';

  @override
  final String labelRed = '炮';

  @override
  bool canEat(Role another, Game game) {
    // 暗杀模式
    if (game.rule == 1) {
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
}

class Knight extends Role {
  @override
  final int power = 3;

  @override
  final String labelBlack = '傌';

  @override
  final String labelRed = '馬';
}

class Castle extends Role {
  @override
  final int power = 4;

  @override
  final String labelBlack = '俥';

  @override
  final String labelRed = '車';
}

class Bishop extends Role {
  @override
  final int power = 5;

  @override
  final String labelBlack = '象';

  @override
  final String labelRed = '相';
}

class Guard extends Role {
  @override
  final int power = 6;

  @override
  final String labelBlack = '仕';

  @override
  final String labelRed = '士';
}

class King extends Role {
  @override
  final int power = 7;

  @override
  final String labelBlack = '将';

  @override
  final String labelRed = '帅';

  /// 除了兵卒(1)，谁都打的过
  @override
  bool _canWin(Role another) => another.power != 1;
}