part of role;

class Minister extends Role {
  @override
  get res => "相";

  @override
  bool _canMoveTo(Location targetLocation) {
    var deltaX = targetLocation.x - location.x;
    var deltaY = targetLocation.y - location.y;
    return deltaX.abs() == deltaY.abs() && deltaX.abs() == 2;
  }

  @override
  List<Location> routeTo(Location targetLocation) {
    if (_canMoveTo(targetLocation)) {
      return [Location((targetLocation.x + location.x) ~/ 2, (targetLocation.y + location.y) ~/ 2)];
    }
    return null;
  }
}