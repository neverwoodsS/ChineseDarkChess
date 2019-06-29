part of control;

class Thinking extends Control {
  Intersection _clickedIntersection;

  Thinking(Kingdom kingdom) : super(kingdom);

  @override
  void clickAtIntersection(Intersection intersection) {
    _clickedIntersection = intersection;
    if (intersection.role == null) _lock = true;
    else _lock = kingdom != intersection.role.kingdom;
  }

  @override
  void movingKingdomChange(Kingdom movingKingdom) {}

  @override
  Future<Control> process() async {
    while (_lock) {
      await Future.delayed(const Duration(milliseconds: 10), () => "10");
    }
    return Picked(kingdom, _clickedIntersection);
  }
}