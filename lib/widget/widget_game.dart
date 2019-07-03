import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ttk_chess/game/game.dart';
import 'package:ttk_chess/game/location.dart';
import 'package:ttk_chess/widget/painter_game.dart';

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameState();
  }
}

class _GameState extends State<GamePage> {
  Game _game;

  GlobalKey _customPaintKey = GlobalKey();
  GamePainter _gamePainter;

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onPanDown: (details) {
          _onPanDown(context, details);
        },
        child: CustomPaint(
          key: _customPaintKey,
          painter: _gamePainter = GamePainter(_game.battlefield),
        ),
      ),
    );
  }

  _onPanDown(context, details) {
    RenderBox getBox = _customPaintKey.currentContext.findRenderObject();
    Offset local = getBox.globalToLocal(details.globalPosition);
    print("click at x:${local.dx}, y:${local.dy}");

    Location location = _gamePainter.getLocationFromOffset(local);
    print("click at location: ${location.x}, ${location.y}");

    _game.clickOnLocation(location);

    setState(() {});
  }
}
