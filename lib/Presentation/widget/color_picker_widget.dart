import 'package:flutter/material.dart';

import 'package:test_task/app_constance.dart';

///widget for color picker
class ColorPickerWidget extends StatelessWidget {
  ///displayed colors
  final List<Color> pickedColors;

  ///on color clicked function
  final Function(Color) onColorTab;

  /// Constructor calling super and initialize pickedColors, onColorTab
  const ColorPickerWidget({
    Key? key,
    required this.pickedColors,
    required this.onColorTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///vertical space
        const SizedBox(
          height: AppConstance.normalPagePadding,
        ),

        ///'Or you can pick one!' text
        const Text('Or you can pick one!'),

        ///vertical space
        const SizedBox(
          height: AppConstance.normalPagePadding,
        ),

        ///color picker
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pickedColors
              .map(
                (e) => InkWell(
                  onTap: () {
                    onColorTab(e);
                  },
                  child: Container(
                    width: AppConstance.colorRadius,
                    height: AppConstance.colorRadius,
                    margin: const EdgeInsets.all(
                      AppConstance.smallPagePadding,
                    ),
                    decoration: BoxDecoration(
                      color: e,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
