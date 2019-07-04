library painter;

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ttk_chess/game/battlefield.dart';
import 'package:ttk_chess/game/location.dart';

part 'painter_grid.dart';
part 'painter_role.dart';

class GamePainter extends CustomPainter {

  Battlefield _battleField;
  GridPainter _gridPainter;
  RolePainter _rolePainter;

  Size _size;

  GamePainter(Battlefield battlefield) {
    this._battleField = battlefield;
    _gridPainter = GridPainter(battlefield);
    _rolePainter = RolePainter(battlefield);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_size == null) {
      _size = size;
    }

    _gridPainter.paint(canvas, size);
    _rolePainter.paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  Location getLocationFromOffset(Offset offset) {
    final height = _size.height;
    final width = height;
    final count = Battlefield.SIZE;

    final x = offset.dx / (width / (count - 1));
    final y = offset.dy / (height / (count - 1));

    var resultX = x.round();
    var resultY = y.round();

    if (resultX < 0) resultX = 0;
    if (resultX > count - 1) resultX = count - 1;
    if (resultY < 0) resultY = 0;
    if (resultY > count - 1) resultY = count - 1;

    return Location(resultX, resultY);
  }
}