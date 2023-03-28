import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/Presentation/logic/color_cubit/color_generator_states.dart';

/// Color Generator Bloc Cubit
class ColorGeneratorCubit extends Cubit<ColorGeneratorStates> {

  /// Generated Color value
  Color generatedColor = Colors.white;

  /// Color Generator Constructor calling super
  ColorGeneratorCubit() : super(ColorInitState());

  /// Color Generator function
  void generateColor() {
    ///get random integer with color primaries length
    generatedColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    ///emit ColorChangeState to change the view
    emit(ColorChangeState());
  }
}
