import 'package:flutter/material.dart';
import 'package:smite_counter_build/business_logic/smite_bloc/smite_cubit.dart';
import 'package:smite_counter_build/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (_) => SmiteCubit(),
        child: const HomeScreen(),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(200, 200, 200, 1),
        colorScheme: const ColorScheme(
          background: Color.fromRGBO(200, 200, 200, 1),
          brightness: Brightness.light,
          primary: Color.fromRGBO(18, 19, 30, 1),
          onPrimary: Color.fromRGBO(18, 19, 30, 1),
          secondary: Color.fromRGBO(73, 84, 111, 1),
          onSecondary: Color.fromRGBO(73, 84, 111, 1),
          error: Colors.red,
          onError: Colors.red,
          onBackground: Color.fromRGBO(200, 200, 200, 1),
          surface: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// AppThemeData lightCardTheme = AppThemeData(
//   background: Colors.blueGrey[200]!,
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(24),
//     ),
//   ),
// );
// AppThemeData darkCardTheme = AppThemeData(
//   background: Colors.blueGrey[800]!,
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(24),
//     ),
//   ),
// );
