import 'package:ttk_chess/role/role.dart';
import 'intersection.dart';
import 'location.dart';

class Battlefield {
  static const SIZE = 17;
  static const DESERT = 4;

  List<List<Intersection>> _sections =
      List.generate(SIZE, (x) => List.generate(SIZE, (y) => Intersection(x, y)));

  void addRoles(List<Role> roles) {
    roles.forEach((role) {
      _sections[role.location.x][role.location.y].role = role;
    });
  }

  int countBlockOfRoute(List<Location> route) {
    var result = 0;
    route.forEach((it) {
      if (_sections[it.x][it.y].role != null) {
        result++;
      }
    });
    return result;
  }

  Intersection getIntersection(Location location) {
    return _sections[location.x][location.y];
  }

  List<Intersection> getIntersectionsWithRole() {
    final result = List<Intersection>();

    _sections.forEach((list) {
      list.forEach((intersection) {
        if (intersection.role != null) {
          result.add(intersection);
        }
      });
    });

    return result;
  }
}