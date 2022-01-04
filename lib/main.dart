import 'package:character_app/presentation/screens/alt_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:character_app/presentation/screens/details_screen.dart';
import 'package:character_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.yellow, //change your color here
          ),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.yellow, fontSize: 25.0)
        ),

      ),
      title: 'Task Management',

      initialRoute: '/',
      routes: {
        '/': (context) => const AltHomeScreen(title: "Characters",),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}

