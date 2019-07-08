part of painter;

class IntersectionPainter {

  static const intersectionSize = 8.0;
  static const boarderSize = 10.0;

  Battlefield _battlefield;
  Paint _paint;

  IntersectionPainter(this._battlefield) {
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

    final intersections = _battlefield.getIntersectionsWithRole();
    intersections.forEach((intersection) {
      final location = intersection.role.location;
      final x = width * location.x / (count - 1);
      final y = height * location.y / (count - 1);
      final center = Offset(x, y);

      _paint.color = Color(intersection.role.kingdom.color);
      canvas.drawCircle(center, intersectionSize, _paint);

      ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontSize: 10,
      ));

      pb.addText(intersection.role.res.toString());
      pb.pushStyle(ui.TextStyle(color: Color(0xffffffff)));

      ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: intersectionSize * 2);

      final paragraph = pb.build()..layout(pc);
      canvas.drawParagraph(paragraph, Offset(x - intersectionSize, y - paragraph.height / 2));

      /// draw picked
      if (intersection.picked == true) {
        canvas.drawLine(Offset(center.dx - boarderSize, center.dy - boarderSize), Offset(center.dx - boarderSize / 2, center.dy - boarderSize), _paint);
        canvas.drawLine(Offset(center.dx + boarderSize, center.dy - boarderSize), Offset(center.dx + boarderSize / 2, center.dy - boarderSize), _paint);
        canvas.drawLine(Offset(center.dx - boarderSize, center.dy + boarderSize), Offset(center.dx - boarderSize / 2, center.dy + boarderSize), _paint);
        canvas.drawLine(Offset(center.dx + boarderSize, center.dy + boarderSize), Offset(center.dx + boarderSize / 2, center.dy + boarderSize), _paint);

        canvas.drawLine(Offset(center.dx - boarderSize, center.dy - boarderSize), Offset(center.dx - boarderSize, center.dy - boarderSize / 2), _paint);
        canvas.drawLine(Offset(center.dx - boarderSize, center.dy + boarderSize), Offset(center.dx - boarderSize, center.dy + boarderSize / 2), _paint);
        canvas.drawLine(Offset(center.dx + boarderSize, center.dy - boarderSize), Offset(center.dx + boarderSize, center.dy - boarderSize / 2), _paint);
        canvas.drawLine(Offset(center.dx + boarderSize, center.dy + boarderSize), Offset(center.dx + boarderSize, center.dy + boarderSize / 2), _paint);
      }
    });
  }
}