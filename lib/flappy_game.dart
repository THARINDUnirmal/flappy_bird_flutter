import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'bird.dart';
import 'pipe.dart';

class FlappyGame extends FlameGame with HasCollisionDetection, TapDetector {
  late Bird bird;
  double pipeTimer = 0;
  final double pipeInterval = 1.5;
  final Random random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    bird = Bird();
    add(bird);
  }

  @override
  void onTap() {
    bird.jump();
  }

  @override
  void update(double dt) {
    super.update(dt);

    pipeTimer += dt;

    if (pipeTimer > pipeInterval) {
      spawnPipePair();
      pipeTimer = 0;
    }
  }

  void spawnPipePair() {
    double gap = 150;
    double pipeHeight = random.nextDouble() * (size.y - gap - 100) + 50;

    Pipe topPipe = Pipe(isBottom: false)
      ..position = Vector2(size.x, pipeHeight - 400);

    Pipe bottomPipe = Pipe(isBottom: true)
      ..position = Vector2(size.x, pipeHeight + gap);

    add(topPipe);
    add(bottomPipe);
  }
}
