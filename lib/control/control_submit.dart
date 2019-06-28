part of control;

class Submit extends Control {
  Intersection from, to;

  Submit(Kingdom kingdom, this.from, this.to) : super(kingdom);

  @override
  void clickAtIntersection(Intersection intersection) {}

  @override
  void movingKingdomChange(Kingdom movingKingdom) {}

  @override
  Future<Control> process() async {
    return Waiting(kingdom);
  }
}