import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  //constructor
  Character(
      {required this.name,
      required this.solgan,
      required this.vocation,
      required this.id});

  //fields
  final Vocation vocation;
  final String name;
  final String solgan;
  final String id;
  bool _isFav = false;

  //getters
  bool get isFav => _isFav;

  //methods
  void toogleIsFav() {
    _isFav = !_isFav;
  }
}
