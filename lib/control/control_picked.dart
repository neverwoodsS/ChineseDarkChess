part of control;

class Picked extends Control {
  Intersection _pickedIntersection;
  Intersection _clickedIntersection;

  Picked(Kingdom kingdom, Game game, this._pickedIntersection) : super(kingdom, game);

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

    if (_clickedIntersection.role == null) {
       final route = _pickedIntersection.role.routeTo(_clickedIntersection.toLocation());
       if (route == null)
         return _thinking();
       else {
         final routeBlockCount = game.countBlockOfRoute(route);
         if (routeBlockCount == 0)
           return _submit();
         else
           return _thinking();
       }
    } else if (_clickedIntersection.role.kingdom == _pickedIntersection.role.kingdom) {
      return _thinking();
    } else {
      final routeBlockCount = game.countBlockOfRoute(_pickedIntersection.role.routeTo(_clickedIntersection.toLocation()));

      // 可以吃子
      if (routeBlockCount == _pickedIntersection.role.acceptableBlockCount)
        return _submit();
      else
        return _thinking();
    }
  }

  _submit() => Submit(kingdom, game, _pickedIntersection, _clickedIntersection);
  _thinking() => Thinking(kingdom, game);
}