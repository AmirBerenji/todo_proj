import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_proj/common/utils/constants.dart';
import 'package:todo_proj/features/todo/pages/homepage.dart';
import 'package:todo_proj/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defualtLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue);

  static final defualtDarkColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375,825),
      minTextAdapt: true,
      builder: (context,child) {
        return DynamicColorBuilder(
          builder: (lightColorScheme,darkColorScheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: AppConst.kBkDark,
                colorScheme: lightColorScheme ?? defualtLightColorScheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme ?? defualtDarkColorScheme,
                scaffoldBackgroundColor: AppConst.kBkDark,
                useMaterial3: true,
              ),
              home: const Homepage(),
            );
          }
        );
      }
    );
  }
}
