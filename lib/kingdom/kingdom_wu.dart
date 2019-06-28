part of kingdom;

class Wu extends Kingdom {
  @override String kingdomName = "吴";
  @override int color = 0x0000ff;

  @override
  bool canRoleMoveTo(Role role, Location location) {
    return role.routeTo(location) != null;
  }
}