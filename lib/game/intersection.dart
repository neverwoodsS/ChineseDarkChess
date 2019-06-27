import 'package:ttk_chess/role/role.dart';

class Intersection {
  final int x, y;
  Role role;
  bool desert;

  Intersection(this.x, this.y) {
    desert = (x < 4 || x > 12) && (y < 4 || y > 12);
  }
}