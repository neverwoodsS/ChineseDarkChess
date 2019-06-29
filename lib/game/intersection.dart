import 'package:ttk_chess/role/role.dart';
import 'battlefield.dart';
import 'location.dart';

class Intersection {

  static const _MIN = Battlefield.DESERT;
  static const _MAX = Battlefield.SIZE - Battlefield.DESERT - 1;

  final int x, y;
  Role role;
  bool desert;

  Intersection(this.x, this.y) {
    desert = (x < _MIN || x > _MAX) && (y < _MIN || y > _MAX);
  }

  toLocation() => Location(x, y);
}