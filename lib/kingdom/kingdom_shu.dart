part of kingdom;

class Shu extends Kingdom {
  @override String kingdomName = "蜀";
  @override int color = 0x00ff00;

  @override
  bool canRoleMoveTo(Role role, Location location) {
    return role.routeTo(location) != null;
  }
}