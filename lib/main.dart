import 'package:flutter/material.dart';
import 'package:test_task/Presentation/screen/color_generator_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const HomeMaterialApp();
  }
}

class HomeMaterialApp extends StatelessWidget {
  const HomeMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const ColorGeneratorScreen()
    );
  }
}
