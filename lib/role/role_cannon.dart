part of role;

class Cannon extends  Rook {
  @override
  get res => "炮";

  @override
  final acceptableBlockCount = 1;
}