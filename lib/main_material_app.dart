import 'package:flutter/material.dart';

import 'package:test_task/Presentation/screen/color_generator_screen.dart';

///Home Material App class
class MainMaterialApp extends StatelessWidget {

  /// Constructor calling super
  const MainMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Generator task',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const ColorGeneratorScreen(),
    );
  }
}
