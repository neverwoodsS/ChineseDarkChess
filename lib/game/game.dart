import 'battlefield.dart';
import 'location.dart';

class Game {

  Battlefield battlefield;

  Game() {
    battlefield = Battlefield();
  }

  int countBlockOfRoute(List<Location> route) => battlefield.countBlockOfRoute(route);
}
