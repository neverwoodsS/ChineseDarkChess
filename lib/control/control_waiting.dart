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
      await Future.delayed(const Duration(seconds: 2), () => "2");
    }
    return Thinking(kingdom);
  }
}