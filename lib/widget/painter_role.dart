part of painter;

class RolePainter {

  static const roleSize = 8.0;

  Battlefield _battlefield;
  Paint _paint;

  RolePainter(this._battlefield) {
    _paint = Paint()
      ..color = Colors.deepOrange // 画笔颜色
      ..strokeCap = StrokeCap.round // 画笔笔触类型
      ..isAntiAlias = true // 是否启动抗锯齿
    ;
  }

  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = height;
    final count = Battlefield.SIZE;

    final roles = _battlefield.getRoles();
    roles.forEach((role) {
      final location = role.location;
      final x = width * location.x / (count - 1);
      final y = height * location.y / (count - 1);

      _paint.color = Color(role.kingdom.color);
      canvas.drawCircle(Offset(x, y), roleSize, _paint);

      ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontSize: 10,
      ));

      pb.addText(role.res.toString());
      pb.pushStyle(ui.TextStyle(color: Color(0xffffffff)));

      ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: roleSize * 2);

      final paragraph = pb.build()..layout(pc);
      canvas.drawParagraph(paragraph, Offset(x - roleSize, y - paragraph.height / 2));
    });
  }
}