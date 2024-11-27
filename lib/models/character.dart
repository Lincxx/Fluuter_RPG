import 'package:flutter_rpg/models/stats.dart';

class Character with Stats {
  //constructor
  Character({required this.name, required this.solgan, required this.id});

  //fields
  final String name;
  final String solgan;
  final String id;
  bool _isFav = false;

  //getters
  get isFav => _isFav;

  void toogleIsFav() {
    _isFav = !_isFav;
  }
}
