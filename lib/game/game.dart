import 'battlefield.dart';
import 'intersection.dart';
import 'location.dart';

class Game {

  List<List<Intersection>> _sections =
      List.generate(BattleField.SIZE, (x) => List.generate(BattleField.SIZE, (y) => Intersection(x, y)));

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
