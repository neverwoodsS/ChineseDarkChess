part of control;

class Waiting extends Control {

  Waiting(Kingdom kingdom) : super(kingdom);

  @override
  void clickAtIntersection(Intersection intersection) {}

  @override
  void movingKingdomChange(Kingdom movingKingdom) {
    _lock = kingdom != movingKingdom;
  }

  @override
  Future<Control> process() async {
    while (_lock) {
      await Future.delayed(const Duration(milliseconds: 10), () => "10");
    }
    return Thinking(kingdom);
  }
}