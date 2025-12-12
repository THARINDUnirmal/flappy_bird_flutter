import 'package:flame/components.dart';

class Pipe extends SpriteComponent with HasGameRef {
  bool isBottom;
  double speed = 150;

  Pipe({required this.isBottom}) : super(size: Vector2(80, 400));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(
      isBottom ? 'pipe_bottom.png' : 'pipe_top.png',
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    x -= speed * dt;

    if (x < -width) {
      removeFromParent();
    }
  }
}
