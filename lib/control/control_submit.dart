part of control;

class Submit extends Control {
  Intersection from, to;

  Submit(Kingdom kingdom, Game game, this.from, this.to) : super(kingdom, game);

  @override
  void clickAtIntersection(Intersection intersection) {}

  @override
  void movingKingdomChange(Kingdom movingKingdom) {}

  @override
  Future<Control> process() async {
    return Waiting(kingdom, game);
  }
}