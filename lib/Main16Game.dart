import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'components/game/Bullet.dart';
import 'components/game/Spaceship.dart';
import 'components/game/Asteroid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var game = MyGame();
  Flame.images.loadAll(['rocket.png', 'asteroid.png', 'laser.png']);
  runApp(game.widget);
}

class MyGame extends BaseGame with TapDetector {
  var spaceship = new Spaceship();
  var creationDragonTimer = 0.0;
  List<Asteroid> dragonList;

  MyGame() {
    dragonList = <Asteroid>[];
    add(spaceship);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    creationDragonTimer += t;
    if (creationDragonTimer >= 0.5) {
      creationDragonTimer = 0.0;
      var dragon = new Asteroid();
      dragonList.add(dragon);
      add(dragon);
    }

    super.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "Player tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    spaceship.direction = details.globalPosition.dx;
    addBullet(details.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "Player tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  void addBullet(Offset position) {
    Bullet bullet = new Bullet(position, dragonList);
    add(bullet);
  }
}