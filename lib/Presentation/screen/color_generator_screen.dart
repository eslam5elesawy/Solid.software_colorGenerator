import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/Presentation/logic/color_cubit/color_generator_cubit.dart';
import 'package:test_task/Presentation/logic/color_cubit/color_generator_states.dart';
import 'package:test_task/Presentation/widget/color_picker_widget.dart';
import 'package:test_task/app_constance.dart';

/// clickable screen to display text "Hello there" in the middle of the screen
class ColorGeneratorScreen extends StatefulWidget {
  /// Constructor calling super
  const ColorGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<ColorGeneratorScreen> createState() => _ColorGeneratorScreenState();
}

class _ColorGeneratorScreenState extends State<ColorGeneratorScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ColorGeneratorCubit>(context).fillColorPickerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ColorGeneratorCubit, ColorGeneratorStates>(
        builder: (colorCtx, colorState) => DecoratedBox(
          decoration: BoxDecoration(
            color: colorCtx.read<ColorGeneratorCubit>().backgroundColor,
          ),
          child: InkWell(
            onTap: () {
              ///calling function to change background color
              colorCtx.read<ColorGeneratorCubit>().updateBackgroundColor();
            },
            onLongPress: () {
              showModalBottomSheet<Widget>(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => Container(
                  height: AppConstance.bottomSheetHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppConstance.normalBorderRadius,
                    ),
                  ),
                  child: ColorPickerWidget(
                    pickedColors:
                        colorCtx.read<ColorGeneratorCubit>().pickedColors,
                    onColorTab: (selectedColor) {
                      ///calling function to change background color
                      colorCtx
                          .read<ColorGeneratorCubit>()
                          .updateBackgroundColor(
                            selectedColor: selectedColor,
                          );

                      ///calling update pick color list
                      colorCtx
                          .read<ColorGeneratorCubit>()
                          .updateColorPickerList();
                      Navigator.of(_).pop();
                    },
                  ),
                ),
              );
            },
            child: const Center(
              child: Text('Hello there'),
            ),
          ),
        ),
      ),
    );
  }
}
