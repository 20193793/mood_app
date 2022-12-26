import 'package:flutter/material.dart';

class Mood {
  AssetImage moodArt;
  String feel;
  final Color color;
  int feelValue;

  Mood(
      {required this.moodArt,
      required this.feel,
      required this.feelValue,
      required this.color});
}
