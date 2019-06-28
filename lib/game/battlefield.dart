import 'intersection.dart';
import 'location.dart';

class Battlefield {
  static const SIZE = 17;
  static const DESERT = 4;

  List<List<Intersection>> _sections =
      List.generate(SIZE, (x) => List.generate(SIZE, (y) => Intersection(x, y)));

  int countBlockOfRoute(List<Location> route) {
    var result = 0;
    route.forEach((it) {
      if (_sections[it.x][it.y].role != null) {
        result++;
      }
    });
    return result;
  }

  Intersection getIntersection(int x, int y) {
    return _sections[x][y];
  }
}