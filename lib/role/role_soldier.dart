part of role;

class Soldier extends Role {
  @override
  get res => "兵";

  @override
  bool canMoveTo(Location targetLocation) {
    var distance = targetLocation.x - location.x + targetLocation.y - location.y;
    return distance.abs() == 1;
  }

  @override
  List<Location> routeTo(Location targetLocation) =>
      canMoveTo(targetLocation) ? [] : null;
}