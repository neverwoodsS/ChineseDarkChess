part of role;

class Guard extends Role {
  @override
  get res => "士";

  @override
  bool canMoveTo(Location targetLocation) {
    var deltaX = targetLocation.x - location.x;
    var deltaY = targetLocation.y - location.y;
    return deltaX.abs() == deltaY.abs() && deltaX.abs() == 1;
  }

  @override
  List<Location> routeTo(Location targetLocation) =>
      canMoveTo(targetLocation) ? [] : null;
}