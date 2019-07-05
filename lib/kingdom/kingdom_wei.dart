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
}