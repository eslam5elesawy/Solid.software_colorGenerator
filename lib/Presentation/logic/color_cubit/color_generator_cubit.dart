import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/Presentation/logic/color_cubit/color_generator_states.dart';

/// Color Generator Bloc Cubit
class ColorGeneratorCubit extends Cubit<ColorGeneratorStates> {
  /// Generated Color value
  Color backgroundColor = Colors.white;

  ///list of colors for color picker
  List<Color> pickedColors = [];

  ///color picker list length
  final int _colorLength = 4;

  /// Color Generator Constructor calling super
  ColorGeneratorCubit() : super(ColorInitState());

  ///  generate background color function
  void updateBackgroundColor({Color? selectedColor}) {
    backgroundColor = selectedColor ?? _generateColor();

    ///emit ColorChangeState to change the view
    emit(ColorChangeState());
  }

  /// Color Generator function
  Color _generateColor() {
    ///get random integer with color primaries length
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  ///fill color picker list function
  void fillColorPickerList() {
    for (int i = 0; i < _colorLength; i++) {
      pickedColors.add(_generateColor());
    }
  }

  ///update color picker list function
  void updateColorPickerList() {
    pickedColors.clear();
    for (int i = 0; i < _colorLength; i++) {
      pickedColors.add(_generateColor());
    }
  }
}
