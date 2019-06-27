import 'intersection.dart';
import 'location.dart';

class Game {

  static final _battleFieldSize = 17;

  List<List<Intersection>> _sections =
      List.generate(_battleFieldSize, (x) => List.generate(_battleFieldSize, (y) => Intersection(x, y)));

  Game();

  int countBlockOfRoute(List<Location> route) {
    var result = 0;
    route.forEach((it) {
      if (_sections[it.x][it.y].role != null) {
        result++;
      }
    });
    return result;
  }
}
