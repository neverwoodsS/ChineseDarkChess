part of control;

class Picked extends Control {
  Intersection _pickedIntersection;
  Intersection _clickedIntersection;

  Picked(Kingdom kingdom, Game game, this._pickedIntersection)
      : super(kingdom, game);

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
      await _delay();
    }

    return _pickedIntersection.role.canMoveTo(_clickedIntersection.toLocation(), _clickedIntersection.role)
        ? _submit()
        : _thinking();
  }

  _submit() => Submit(kingdom, game, _pickedIntersection, _clickedIntersection);

  _thinking() => Thinking(kingdom, game);
}
