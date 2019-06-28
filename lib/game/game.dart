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
    _initKingdoms();
    _initBattlefield();
    _initControls();

    _startWeiControl();
    _startShuControl();
    _startWuControl();
  }

  clickOnLocation(Location location) {
    final intersection = _battlefield.getIntersection(location.x, location.y);
    _weiControl.clickAtIntersection(intersection);
    _shuControl.clickAtIntersection(intersection);
    _wuControl.clickAtIntersection(intersection);
  }

  int countBlockOfRoute(List<Location> route) => _battlefield.countBlockOfRoute(route);

  _initKingdoms() {
    _wei = Wei()..game = this;
    _shu = Shu()..game = this;
    _wu = Wu()..game = this;

    theMovingKingdom = _shu;
  }

  _initBattlefield() {
    _battlefield = Battlefield();
    _battlefield.addRoles(_wei.roles);
    _battlefield.addRoles(_shu.roles);
    _battlefield.addRoles(_wu.roles);
  }

  _initControls() {
    _weiControl = Waiting(_wei);
    _shuControl = Waiting(_shu);
    _wuControl = Waiting(_wu);
  }

  _startWeiControl() async {
    _weiControl.movingKingdomChange(theMovingKingdom);
    while (true) {
      _weiControl = await _weiControl.process();
      print("control kingdom = ${_weiControl.kingdom.kingdomName}, control type = ${_weiControl.toString()}");
      if (_weiControl is Submit) {
        // todo 判断吃子等逻辑
        // 切换到下一位
        _turnToNextKingdom();
      }
    }
  }

  _startShuControl() async {
    _shuControl.movingKingdomChange(theMovingKingdom);
    while (true) {
      _shuControl = await _shuControl.process();
      print("control kingdom = ${_shuControl.kingdom.kingdomName}, control type = ${_shuControl.toString()}");
      if (_shuControl is Submit) {
        // todo 判断吃子等逻辑
        // 切换到下一位
        _turnToNextKingdom();
      }
    }
  }

  _startWuControl() async {
    _wuControl.movingKingdomChange(theMovingKingdom);
    while (true) {
      _wuControl = await _wuControl.process();
      print("control kingdom = ${_wuControl.kingdom.kingdomName}, control type = ${_wuControl.toString()}");
      if (_wuControl is Submit) {
        // todo 判断吃子等逻辑
        // 切换到下一位
        _turnToNextKingdom();
      }
    }
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