import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'flappy_game.dart';

void main() {
  // Make sure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Start the Flame game
  runApp(GameWidget(game: FlappyGame()));
}
