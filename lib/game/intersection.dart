import 'package:ttk_chess/role/role.dart';
import 'battle_field.dart';

class Intersection {

  final _min = BattleField.DESERT;
  final _max = BattleField.SIZE - BattleField.DESERT - 1;

  final int x, y;
  Role role;
  bool desert;

  Intersection(this.x, this.y) {
    desert = (x < _min || x > _max) && (y < _min || y > _max);
  }
}