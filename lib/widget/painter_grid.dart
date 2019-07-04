part of painter;

class GridPainter {

  Battlefield _battlefield;
  Paint _paint;

  GridPainter(this._battlefield) {
    _paint = Paint()
      ..color = Colors.blueAccent //画笔颜色
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
    ;
  }

  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = height;
    final count = Battlefield.SIZE;

    for (var i = 0; i < count; i++) {
      final y = height * i / (count - 1);
      canvas.drawLine(Offset(0, y), Offset(width, y), _paint);

      final x = width * i / (count - 1);
      canvas.drawLine(Offset(x, 0), Offset(x, height), _paint);
    }
  }
}