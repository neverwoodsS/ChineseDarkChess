part of kingdom;

class Shu extends Kingdom {

  Shu() {
    roles = _initRoles();
  }

  List<Role> _initRoles() {
    return [
      Soldier()..location = Location(12, 13)..kingdom = this,
      Soldier()..location = Location(10, 13)..kingdom = this,
      Soldier()..location = Location(08, 13)..kingdom = this,
      Soldier()..location = Location(06, 13)..kingdom = this,
      Soldier()..location = Location(04, 13)..kingdom = this,
      Cannon()..location = Location(11, 14)..kingdom = this,
      Cannon()..location = Location(05, 14)..kingdom = this,
      Rook()..location = Location(12, 16)..kingdom = this,
      Rook()..location = Location(04, 16)..kingdom = this,
      Knight()..location = Location(11, 16)..kingdom = this,
      Knight()..location = Location(05, 16)..kingdom = this,
      Minister()..location = Location(10, 16)..kingdom = this,
      Minister()..location = Location(06, 16)..kingdom = this,
      Guard()..location = Location(09, 16)..kingdom = this,
      Guard()..location = Location(07, 16)..kingdom = this,
      King(kingdomName)..location = Location(08, 16)..kingdom = this,
    ];
  }

  @override String kingdomName = "蜀";
  @override int color = 0xff00ff00;

  @override
  bool canRoleMoveTo(Role startRole, Role targetRole, Location targetLocation, List<Location> route) {
    final superResult = super.canRoleMoveTo(startRole, targetRole, targetLocation, route);

    if (superResult) {
      // 相不能离开本土
      if (startRole is Minister && targetLocation.y < 12)
        return false;
      // 士、王不能离开九宫格
      if ((startRole is Guard || startRole is King) && (targetLocation.y < 14 || targetLocation.x < 7 || targetLocation.x > 9))
        return false;
      // 兵在国境线及国境内不能后退
      if (startRole is Soldier && (startRole.location.y >= 12 && targetLocation.y > startRole.location.y))
        return false;
    } else return false;

    return true;
  }
}