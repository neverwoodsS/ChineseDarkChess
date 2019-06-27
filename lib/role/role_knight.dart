part of role;

class Knight extends Role {
  @override
  get res => "马";

  @override
  bool _canMoveTo(Location targetLocation) {
    var area = (targetLocation.x - location.x) * (targetLocation.y - location.y);
    return area.abs() == 2;
  }

  @override
  List<Location> routeTo(Location targetLocation) {
    if (_canMoveTo(targetLocation)) {
      List<Location> result = [];

      var deltaX = targetLocation.x - location.x;
      var deltaY = targetLocation.y - location.y;
      if (deltaX.abs() == 2) {
        result.add(Location(location.x + deltaX ~/ 2, location.y));
      } else {
        result.add(Location(location.x, location.y + deltaY ~/ 2));
      }

      return result;
    }

    return null;
  }
}