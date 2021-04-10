import 'package:flame/components/component.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learning/components/game/Asteroid.dart';

const ComponentSize = 35.0;
const SPEED = 150.0;

class Bullet extends SpriteComponent {
  Offset initialDirection;
  List<Asteroid> dragonList;
  var bulletDestroy = false;

  Bullet(this.initialDirection, this.dragonList)
      : super.rectangle(15.0, ComponentSize, 'laser.png');

  @override
  void update(double t) {
    super.update(t);
    this.y -= t * SPEED;

    if (dragonList.isNotEmpty) {
      dragonList.forEach((dragon) {
        if (!dragon.remove) {
          bool remove = this.toRect().contains(dragon.toRect().bottomCenter) ||
              this.toRect().contains(dragon.toRect().bottomLeft) ||
              this.toRect().contains(dragon.toRect().bottomRight);
          if (remove) {
            dragon.remove = true;
            bulletDestroy = true;
          }
        }
      });
    }
  }

  @override
  bool destroy() {
    if (this.y < 0) {
      return true;
    }
    return bulletDestroy;
  }

  @override
  void resize(Size size) {
    this.x = this.initialDirection.dx + 15;
    this.y = size.height - 55;
  }
}