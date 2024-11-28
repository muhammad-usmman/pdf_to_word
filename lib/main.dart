import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_to_word/controller/cubits/file_picker_cubit/file_picker_cubit.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_cubit.dart';
import 'package:pdf_to_word/controller/cubits/theme_Cubit/theme_state.dart';
import 'package:pdf_to_word/utils/prefrences/user_prefs.dart';
 import 'package:pdf_to_word/view/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefs.init();
  await dotenv.load(); // Load the .env file

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
        BlocProvider(create: (context) => FilePickerCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
              designSize: const Size(800, 600),

              minTextAdapt: true,
              splitScreenMode: false,
              // Use builder only if you need to use library outside ScreenUtilInit context
              builder: (_ , child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Document Convertor',
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
