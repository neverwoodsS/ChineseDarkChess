part of kingdom;

class Wei extends Kingdom {

  Wei() {
    roles = _initRoles();
  }

  List<Role> _initRoles() {
    return [
      Soldier()..location = Location(12, 03)..kingdom = this,
      Soldier()..location = Location(10, 03)..kingdom = this,
      Soldier()..location = Location(08, 03)..kingdom = this,
      Soldier()..location = Location(06, 03)..kingdom = this,
      Soldier()..location = Location(04, 03)..kingdom = this,
      Cannon()..location = Location(11, 02)..kingdom = this,
      Cannon()..location = Location(05, 02)..kingdom = this,
      Rook()..location = Location(12, 00)..kingdom = this,
      Rook()..location = Location(04, 00)..kingdom = this,
      Knight()..location = Location(11, 00)..kingdom = this,
      Knight()..location = Location(05, 00)..kingdom = this,
      Minister()..location = Location(10, 00)..kingdom = this,
      Minister()..location = Location(06, 00)..kingdom = this,
      Guard()..location = Location(09, 00)..kingdom = this,
      Guard()..location = Location(07, 00)..kingdom = this,
      King(kingdomName)..location = Location(08, 00)..kingdom = this,
    ];
  }

  @override String kingdomName = "魏";
  @override int color = 0xffff0000;

  @override
  bool canRoleMoveTo(Role startRole, Role targetRole, Location targetLocation, List<Location> route) {
    final superResult = super.canRoleMoveTo(startRole, targetRole, targetLocation, route);

    if (superResult) {
      // 相不能离开本土
      if (startRole is Minister && targetLocation.y > 4)
        return false;
      // 士、王不能离开九宫格
      if ((startRole is Guard || startRole is King) && (targetLocation.y > 2 || targetLocation.x < 7 || targetLocation.x > 9))
        return false;
      // 兵在国境线及国境内不能后退
      if (startRole is Soldier && (startRole.location.y <= 4 && targetLocation.y < startRole.location.y))
        return false;
    } else return false;

    return true;
  }
}