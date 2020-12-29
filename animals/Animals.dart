import 'dart:math';

import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import 'Stats.dart';

class Animals {
  String _name;
  Map<int, int> stats = new Map();
  bool isLive = true;

  int get acctualHp {
    return stats[StatsType.ACCTUALHP];
  }

  set acctualHp(int count) {
    stats[StatsType.ACCTUALHP] = count;
  }

  int get maxHp {
    return stats[StatsType.MAXHP];
  }

  set maxHp(int count) {
    stats[StatsType.MAXHP] = count;
  }

  int get speed {
    return stats[StatsType.SPEED];
  }

  set speed(int count) {
    stats[StatsType.SPEED] = count;
  }

  int get strengh {
    return stats[StatsType.STRENGH];
  }

  set strengh(int count) {
    stats[StatsType.STRENGH] = count;
  }

  int get defence {
    return stats[StatsType.DEFENCE];
  }

  set defence(int count) {
    stats[StatsType.DEFENCE] = count;
  }

  String get name {
    return Language.getTranslation(LanguagesTypes.ANIMALS, this._name);
  }

  Animals create(String name, int maxHp, int speed, int strengh, int defence) {
    Animals animal = new Animals();
    animal._name = name;
    animal.maxHp = animal.acctualHp = maxHp;
    animal.speed = speed;
    animal.strengh = strengh;
    animal.defence = defence;
    return animal;
  }

  int atack(Animals enemy) {
    int hitChance = calcHitChance(this.speed, enemy.speed);
    Random rnd = Random();
    int damage = 0;
    if (hitChance >= rnd.nextInt(200)) {
      damage = doDamage(this, enemy, rnd);
    }
    return damage;
  }

  int calcHitChance(int atackerSpeed, int defendingSpeed) {
    return ((atackerSpeed.toDouble() / defendingSpeed.toDouble()) * 100)
        .toInt();
  }

  int doDamage(Animals atacker, Animals defending, Random rnd) {
    int maxDamage = 0;
    maxDamage = atacker.strengh - defending.defence;
    if (maxDamage <= 0) {
      maxDamage = 1;
    }

    int damage = rnd.nextInt(maxDamage + 1);
    defending.acctualHp -= damage;
    if (defending.acctualHp <= 0) {
      defending.acctualHp = 0;
      defending.isLive = false;
    }
    return damage;
  }
}
