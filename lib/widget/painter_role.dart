part of painter;

class RolePainter {

  static const roleSize = 8.0;

  Battlefield _battlefield;
  Paint _paint;

  RolePainter(this._battlefield) {
    _paint = Paint()
      ..color = Colors.deepOrange //画笔颜色
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
    ;
  }

  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = height;
    final count = Battlefield.SIZE;

    final roles = _battlefield.getRoles();
    roles.forEach((role) {
      final location = role.location;
      final x = width * location.x / count;
      final y = height * location.y / count;

      canvas.drawCircle(Offset(x, y), roleSize, _paint);
    });
  }
}