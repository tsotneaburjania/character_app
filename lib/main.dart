import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/presentation/screens/add_screen.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/presentation/screens/details_screen.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/presentation/screens/edit_screen.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/presentation/screens/home_screen.dart';

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
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddScreen(),
        '/details': (context) => const DetailsScreen(),
        '/edit': (context) => const EditScreen(),
      },
    );
  }
}

