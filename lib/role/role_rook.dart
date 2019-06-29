part of role;

class Rook extends Role {
  @override
  get res => "车";

  @override
  bool _canMoveTo(Location targetLocation) {
    var deltaX = targetLocation.x - location.x;
    var deltaY = targetLocation.y - location.y;
    return deltaX * deltaY == 0 && deltaX + deltaY != 0;
  }

  @override
  List<Location> routeTo(Location targetLocation) {
    if (_canMoveTo(targetLocation)) {
      List<Location> result = [];

      var deltaX = targetLocation.x - location.x;
      var deltaY = targetLocation.y - location.y;
      if (deltaX == 0) {
        var unit = deltaY > 0 ? 1 : -1;
        for (var y = location.y; targetLocation.y - y != unit; y += unit) {
          result.add(Location(location.x, y + unit));
        }
      } else {
        var unit = deltaX > 0 ? 1 : -1;
        for (var x = location.x; targetLocation.x - x != unit; x += unit) {
          result.add(Location(x + unit, location.y));
        }
      }

      return result;
    }
    return null;
  }
}