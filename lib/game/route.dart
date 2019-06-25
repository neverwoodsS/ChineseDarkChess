import 'game.dart';
import 'location.dart';

class Route {
  Location _start;
  Location _end;

  Route(this._start, this._end);

  int countBlock(Game game) {
    // strait line
    if (_start.x - _end.x == 0 || _start.y - _end.y == 0) {
      return _countBlockOfStraitLine(game);
    }

    // square
    if ((_start.x - _end.x).abs() == (_start.y - _end.y).abs()) {
      return _countBlockOfSquare(game);
    }

    // rect
    return _countBlockOfRect(game);
  }

  int _countBlockOfStraitLine(Game game) {
    return 0;
  }

  int _countBlockOfSquare(Game game) {
    return 0;
  }

  int _countBlockOfRect(Game game) {
    return 0;
  }
}