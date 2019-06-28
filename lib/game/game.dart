import 'dart:async';
import 'package:ttk_chess/control/control.dart';
import 'package:ttk_chess/kingdom/kingdom.dart';
import 'battlefield.dart';
import 'location.dart';

class Game {

  Battlefield _battlefield;

  Kingdom theMovingKingdom;

  Kingdom _wei;
  Kingdom _shu;
  Kingdom _wu;

  Control _weiControl;
  Control _shuControl;
  Control _wuControl;

  Game() {
    _battlefield = Battlefield();

    theMovingKingdom = _wu;

    _initKingdoms();
    _initControls();

    _startControl(_weiControl);
    _startControl(_shuControl);
    _startControl(_wuControl);
  }

  clickOnLocation(Location location) {
    final intersection = _battlefield.getIntersection(location.x, location.y);
    _weiControl.clickAtIntersection(intersection);
    _shuControl.clickAtIntersection(intersection);
    _wuControl.clickAtIntersection(intersection);
  }

  int countBlockOfRoute(List<Location> route) => _battlefield.countBlockOfRoute(route);

  turnToNextKingdom() {
    if (theMovingKingdom == _wei) {
      theMovingKingdom = _shu;
    } else if (theMovingKingdom == _shu) {
      theMovingKingdom = _wu;
    } else if (theMovingKingdom == _wu) {
      theMovingKingdom = _wei;
    }
  }

  _initKingdoms() {
    _wei = Wei()..game = this;
    _shu = Shu()..game = this;
    _wu = Wu()..game = this;
  }

  _initControls() {
    _weiControl = Waiting(_wei);
    _shuControl = Waiting(_shu);
    _wuControl = Waiting(_wu);
  }

  _startControl(Control control) async {
    control.movingKingdomChange(theMovingKingdom);
    while (true) {
      control = await control.process();
      print("control kingdom = ${control.kingdom.kingdomName}, control type = ${control.toString()}");
      if (control is Submit) {
        // todo 判断吃子等逻辑
        // 切换到下一位
        turnToNextKingdom();
      }
    }
  }
}
