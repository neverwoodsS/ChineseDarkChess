part of kingdom;

class Wu extends Kingdom {

  Wu() {
    roles = _initRoles();
  }

  List<Role> _initRoles() {
    return [
      Soldier()..location = Location(13, 04)..kingdom = this,
      Soldier()..location = Location(13, 06)..kingdom = this,
      Soldier()..location = Location(13, 08)..kingdom = this,
      Soldier()..location = Location(13, 10)..kingdom = this,
      Soldier()..location = Location(13, 12)..kingdom = this,
      Cannon()..location = Location(14, 05)..kingdom = this,
      Cannon()..location = Location(14, 11)..kingdom = this,
      Rook()..location = Location(16, 04)..kingdom = this,
      Rook()..location = Location(16, 12)..kingdom = this,
      Knight()..location = Location(16, 05)..kingdom = this,
      Knight()..location = Location(16, 11)..kingdom = this,
      Minister()..location = Location(16, 06)..kingdom = this,
      Minister()..location = Location(16, 10)..kingdom = this,
      Guard()..location = Location(16, 07)..kingdom = this,
      Guard()..location = Location(16, 09)..kingdom = this,
      King(kingdomName)..location = Location(16, 08)..kingdom = this,
    ];
  }

  @override String kingdomName = "吴";
  @override int color = 0xff0000ff;

  @override
  bool canRoleMoveTo(Role startRole, Role targetRole, Location targetLocation, List<Location> route) {
    final superResult = super.canRoleMoveTo(startRole, targetRole, targetLocation, route);

    if (superResult) {
      // 相不能离开本土
      if (startRole is Minister && targetLocation.x < 12)
        return false;
      // 士、王不能离开九宫格
      if ((startRole is Guard || startRole is King) && (targetLocation.x < 14 || targetLocation.y < 7 || targetLocation.y > 9))
        return false;
    } else return false;

    return true;
  }
}