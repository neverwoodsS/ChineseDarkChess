part of control;

class Picked extends Control {
  Intersection _pickedIntersection;
  Intersection _clickedIntersection;

  Picked(Kingdom kingdom, this._pickedIntersection) : super(kingdom);

  @override
  void clickAtIntersection(Intersection intersection) {
    _clickedIntersection = intersection;
    _lock = false;
  }

  @override
  void movingKingdomChange(Kingdom movingKingdom) {}

  @override
  Future<Control> process() async {
    while (_lock) {
      await Future.delayed(const Duration(milliseconds: 10), () => "10");
    }

    if (_clickedIntersection.role == null) return Submit(kingdom, _pickedIntersection, _clickedIntersection);
    else if (_clickedIntersection.role.kingdom == kingdom) return Thinking(kingdom);
    else return Submit(kingdom, _pickedIntersection, _clickedIntersection);
  }
}