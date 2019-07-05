import 'package:flutter/widgets.dart';
import 'package:ttk_chess/control/control.dart';
import 'package:ttk_chess/kingdom/kingdom.dart';
import 'battlefield.dart';
import 'location.dart';

class Game {

  State state;

  Battlefield battlefield;
  Kingdom theMovingKingdom;

  Kingdom _wei;
  Kingdom _shu;
  Kingdom _wu;

  Map<Kingdom, Control> _controls = {};

  Game(this.state) {
    _initKingdoms();
    _initBattlefield();
    _initControls();

    _startControl(_wei);
    _startControl(_shu);
    _startControl(_wu);
  }

  clickOnLocation(Location location) {
    final intersection = battlefield.getIntersection(location);
    _controls.forEach((kingdom, control) {
      control.clickAtIntersection(intersection);
    });
  }

  int countBlockOfRoute(List<Location> route) => battlefield.countBlockOfRoute(route);

  _initKingdoms() {
    _wei = Wei()..game = this;
    _shu = Shu()..game = this;
    _wu = Wu()..game = this;

    theMovingKingdom = _shu;
  }

  _initBattlefield() {
    battlefield = Battlefield();
    battlefield.addRoles(_wei.roles);
    battlefield.addRoles(_shu.roles);
    battlefield.addRoles(_wu.roles);
  }

  _initControls() {
    _controls[_wei] = Waiting(_wei, this);
    _controls[_shu] = Waiting(_shu, this);
    _controls[_wu] = Waiting(_wu, this);
  }

  _startControl(Kingdom kingdom) async {
    _controls[kingdom]?.movingKingdomChange(theMovingKingdom);
    while (true) {
      final futureControl = await _controls[kingdom].process();
      _controls[kingdom] = futureControl;

      print("control kingdom = ${kingdom.kingdomName}, control type = ${futureControl.toString()}");
      if (_controls[kingdom] is Submit) {
        _submit(futureControl);
      }

      // update widget
      // ignore: invalid_use_of_protected_member
      state?.setState(() {});
    }
  }

  _submit(Submit submit) {
    final winner = submit.from.role;
    final loser = submit.to.role;

    if (loser != null) {
      loser.died = true;
    }

    // 新位置更新
    winner.location = submit.to.toLocation();
    submit.to.role = winner;

    // 旧位置更新
    submit.from.role = null;

    _turnToNextKingdom();
  }

  _turnToNextKingdom() {
    if (theMovingKingdom == _wei) {
      theMovingKingdom = _shu;
    } else if (theMovingKingdom == _shu) {
      theMovingKingdom = _wu;
    } else if (theMovingKingdom == _wu) {
      theMovingKingdom = _wei;
    }

    _controls.forEach((kingdom, control) {
      control.movingKingdomChange(theMovingKingdom);
    });
  }
}