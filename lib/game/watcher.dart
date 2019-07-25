import 'package:ttk_chess/kingdom/kingdom.dart';

class Watcher {

  List<Kingdom> _kingdoms;
  Kingdom currentKingdom;

  Watcher(Kingdom one, Kingdom two,  Kingdom three) {
    one.next = two;
    two.next = three;
    three.next = one;

    _kingdoms = [one, two, three];
    currentKingdom = one;
  }

  work() {
    _decideNextKingdom();
  }

  _decideNextKingdom() {
    // check next
    var next = currentKingdom.next;
    var king = next.king;
    var result = _kingdoms.expand((kingdom) => kingdom.roles)
        .where((role) { return role.died != true; })
        .firstWhere((role) => role.canMoveTo(king.location, king), orElse: () { return king; });

    if (result != king) {
      currentKingdom = next;
    }

    // check next.next
    else {
      next = next.next;
      king = next.king;
      result = _kingdoms.expand((kingdom) => kingdom.roles)
          .where((role) { return role.died != true; })
          .firstWhere((role) => role.canMoveTo(king.location, king), orElse: () { return king; });

      if (result != king) {
        currentKingdom = next;
      } else {
        currentKingdom =  currentKingdom.next;
      }
    }
  }
}