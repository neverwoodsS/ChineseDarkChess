part of control;

class Thinking extends Control {
  Intersection _clickedIntersection;

  Thinking(Kingdom kingdom, Game game) : super(kingdom, game);

  @override
  void clickAtIntersection(Intersection intersection) {
    _clickedIntersection = intersection;
    if (intersection.role != null && kingdom == intersection.role.kingdom) {
      _completer.complete();
    }
  }

  @override
  void movingKingdomChange(Kingdom movingKingdom) {}

  @override
  Future<Control> process() async {
    await _completer.future;
    return Picked(kingdom, game, _clickedIntersection);
  }
}