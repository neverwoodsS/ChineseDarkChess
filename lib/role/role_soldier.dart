part of role;

class Soldier extends Role {
  @override
  get res => "兵";

  @override
  bool _canMoveTo(Location targetLocation) {
    var distance = (targetLocation.x - location.x).abs() + (targetLocation.y - location.y).abs();
    return distance == 1;
  }

  @override
  List<Location> routeTo(Location targetLocation) =>
      _canMoveTo(targetLocation) ? [] : null;
}