import 'location.dart';
import 'role.dart';

abstract class Kingdom {
  String kingdomName;
  int color;
  List<Role> roles;

  bool canRoleMoveTo(Role role, Location location);
}

class Wei extends Kingdom {
  @override String kingdomName = "魏";
  @override int color = 0xff0000;

  @override
  bool canRoleMoveTo(Role role, Location location) {
    return true;
  }
}