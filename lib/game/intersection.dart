import 'package:ttk_chess/role/role.dart';
import 'battle_field.dart';

class Intersection {

  static const _MIN = BattleField.DESERT;
  static const _MAX = BattleField.SIZE - BattleField.DESERT - 1;

  final int x, y;
  Role role;
  bool desert;

  Intersection(this.x, this.y) {
    desert = (x < _MIN || x > _MAX) && (y < _MIN || y > _MAX);
  }
}