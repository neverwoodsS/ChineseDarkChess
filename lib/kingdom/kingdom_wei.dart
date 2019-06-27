part of kingdom;

class Wei extends Kingdom {
  @override String kingdomName = "魏";
  @override int color = 0xff0000;

  @override
  bool canRoleMoveTo(Role role, Location location) {
    return true;
  }
}