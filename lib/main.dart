import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/controller/cubits/theme_cubit.dart';
import 'package:pdf_to_word/view/screens/home_scree/home_screen.dart';
import 'package:pdf_to_word/view/screens/splash_screen.dart';
import 'controller/cubits/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
              designSize: Size(800, 600),

              minTextAdapt: true,
              splitScreenMode: false,
              // Use builder only if you need to use library outside ScreenUtilInit context
              builder: (_ , child) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: state.themeData,
                home: const SplashScreen(),
              );
            }
          );
        },
      ),
    );
  }
}
