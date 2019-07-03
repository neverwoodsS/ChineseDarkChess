import 'package:ttk_chess/control/control.dart';
import 'package:ttk_chess/kingdom/kingdom.dart';
import 'package:ttk_chess/role/role.dart';
import 'battlefield.dart';
import 'location.dart';

class Game {

  Battlefield battlefield;

  Kingdom theMovingKingdom;

  Kingdom _wei;
  Kingdom _shu;
  Kingdom _wu;

  Control _weiControl;
  Control _shuControl;
  Control _wuControl;

  Game() {
    _initKingdoms();
    _initBattlefield();
    _initControls();

    _startWeiControl();
    _startShuControl();
    _startWuControl();
  }

  clickOnLocation(Location location) {
    final intersection = battlefield.getIntersection(location);
    _weiControl.clickAtIntersection(intersection);
    _shuControl.clickAtIntersection(intersection);
    _wuControl.clickAtIntersection(intersection);
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
    _weiControl = Waiting(_wei, this);
    _shuControl = Waiting(_shu, this);
    _wuControl = Waiting(_wu, this);
  }

  _startWeiControl() async {
    _weiControl.movingKingdomChange(theMovingKingdom);
    while (true) {
      _weiControl = await _weiControl.process();
      print("control kingdom = ${_weiControl.kingdom.kingdomName}, control type = ${_weiControl.toString()}");
      if (_weiControl is Submit) {
        _submit(_weiControl);
      }
    }
  }

  _startShuControl() async {
    _shuControl.movingKingdomChange(theMovingKingdom);
    while (true) {
      _shuControl = await _shuControl.process();
      print("control kingdom = ${_shuControl.kingdom.kingdomName}, control type = ${_shuControl.toString()}");
      if (_shuControl is Submit) {
        _submit(_shuControl);
      }
    }
  }

  _startWuControl() async {
    _wuControl.movingKingdomChange(theMovingKingdom);
    while (true) {
      _wuControl = await _wuControl.process();
      print("control kingdom = ${_wuControl.kingdom.kingdomName}, control type = ${_wuControl.toString()}");
      if (_wuControl is Submit) {
        _submit(_wuControl);
      }
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

    _weiControl.movingKingdomChange(theMovingKingdom);
    _shuControl.movingKingdomChange(theMovingKingdom);
    _wuControl.movingKingdomChange(theMovingKingdom);
  }
}