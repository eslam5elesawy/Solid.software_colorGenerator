import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/Presentation/logic/color_cubit/color_generator_cubit.dart';
import 'package:test_task/Presentation/screen/color_generator_screen.dart';

///Home Material App class contain MultiBlocProvider
class MainMaterialApp extends StatelessWidget {
  /// Constructor calling super
  const MainMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorGeneratorCubit>(
            create: (context) => ColorGeneratorCubit(),)
      ],
      child: MaterialApp(
        title: 'Color Generator task',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: const ColorGeneratorScreen(),
      ),
    );
  }
}
