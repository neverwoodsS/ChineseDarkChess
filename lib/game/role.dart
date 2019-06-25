import 'kingdom.dart';
import 'location.dart';

abstract class Role {
  /// 可以是文字，也可以是图片资源
  /// 取决于显示实现方案
  var res;

  Kingdom kingdom;
  Location location;
  int acceptableBlockCount = 0;

  bool canMoveTo(Location targetLocation);

  /// 返回 null 则为不可达
  /// 非 null 则可达，但仍需其他检查
  /// 例如终点是否有友军，相士兵的移动限制等
  List<Location> routeTo(Location targetLocation);
}

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

class Chariot extends Role {
  @override
  get res => "车";

  @override
  bool canMoveTo(Location targetLocation) {
    var deltaX = targetLocation.x - location.x;
    var deltaY = targetLocation.y - location.y;
    return deltaX * deltaY == 0 && deltaX + deltaY != 0;
  }

  @override
  List<Location> routeTo(Location targetLocation) {
    if (canMoveTo(targetLocation)) {
      List<Location> result = [];

      var deltaX = targetLocation.x - location.x;
      var deltaY = targetLocation.y - location.y;
      if (deltaX == 0) {
        var unit = deltaY > 0 ? 1 : -1;
        for (var y = location.y; targetLocation.y - y != unit; y += unit) {
          result.add(Location(location.x, y));
        }
      } else {
        var unit = deltaX > 0 ? 1 : -1;
        for (var x = location.x; targetLocation.x - x != unit; x += unit) {
          result.add(Location(x, location.y));
        }
      }

      return result;
    }
    return null;
  }
}

class Cavalry extends Role {
  @override
  get res => "马";

  @override
  bool canMoveTo(Location targetLocation) {
    var area = (targetLocation.x - location.x) * (targetLocation.y - location.y);
    return area.abs() == 2;
  }

  @override
  List<Location> routeTo(Location targetLocation) {
    if (canMoveTo(targetLocation)) {
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

class King extends Soldier {
  @override var res;
  King(this.res);
}