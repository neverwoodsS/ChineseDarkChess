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
}