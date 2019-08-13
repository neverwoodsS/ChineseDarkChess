part of control;

class Waiting extends Control {

  Waiting(Kingdom kingdom, Game game) : super(kingdom, game);

  @override
  void clickAtIntersection(Intersection intersection) {}

  @override
  void movingKingdomChange(Kingdom movingKingdom) {
    if (kingdom == movingKingdom) {
      _completer.complete();
    }
  }

  @override
  Future<Control> process() async {
    await _completer.future;
    return Thinking(kingdom, game);
  }
}