part of control;

class Waiting extends Control {

  Waiting(Kingdom kingdom, Game game) : super(kingdom, game);

  @override
  void clickAtIntersection(Intersection intersection) {}

  @override
  void movingKingdomChange(Kingdom movingKingdom) {
    _lock = kingdom != movingKingdom;
  }

  @override
  Future<Control> process() async {
    while (_lock) {
      await _delay();
    }
    return Thinking(kingdom, game);
  }
}