// state.dart


import 'package:flutter/material.dart';

abstract class TextState {}

class TextInitial extends TextState {
  final String text;
  final Color color;

  TextInitial({required this.text,required this.color});
}
class SnackBarShown extends TextState {}