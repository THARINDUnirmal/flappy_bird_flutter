import 'package:flame/components.dart';

class Bird extends SpriteComponent with HasGameRef {
  double velocity = 0;
  final double gravity = 800;
  final double jumpForce = -250;

  Bird() : super(size: Vector2(50, 40));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bird.png');
    position = Vector2(gameRef.size.x / 4, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);

    velocity += gravity * dt;
    y += velocity * dt;

    if (y < 0) y = 0;
  }

  void jump() {
    velocity = jumpForce;
  }
}
