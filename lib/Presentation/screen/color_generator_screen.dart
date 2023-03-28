import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/Presentation/logic/color_cubit/color_generator_cubit.dart';
import 'package:test_task/Presentation/logic/color_cubit/color_generator_states.dart';

///screen to display text "Hello there" in the middle of the screen
class ColorGeneratorScreen extends StatelessWidget {

  /// Constructor calling super
  const ColorGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ColorGeneratorCubit>(
        create:(context) => ColorGeneratorCubit(),
        child: BlocBuilder<ColorGeneratorCubit,ColorGeneratorStates>(
          builder: (colorCtx, colorState) => DecoratedBox(
            decoration: BoxDecoration(
                color: colorCtx.read<ColorGeneratorCubit>().generatedColor,
            ),
            child: InkWell(
              onTap: () {
                ///calling function to change background color
                colorCtx.read<ColorGeneratorCubit>().generateColor();
              },
              ///central 'Hello there' text
              child: const Center(
                child: Text('Hello there'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
