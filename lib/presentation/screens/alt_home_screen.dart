import 'dart:convert';
import 'package:character_app/data/character.dart';
import 'package:character_app/data/planet.dart';
import 'package:character_app/logic/crud_operations.dart';
import 'package:character_app/presentation/widgets/character_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AltHomeScreen extends StatefulWidget {
  final String title;

  const AltHomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AltHomeScreen> createState() => _AltHomeScreenState();
}

class _AltHomeScreenState extends State<AltHomeScreen> {
  late Future<List<Character>> chars;
  late Future<List<Planet>> planets;

  @override
  void initState() {
    super.initState();
    chars =
        CRUDOperations.fetchAllCharacters(http.Client());
    planets =
        CRUDOperations.fetchAllPlanets(http.Client());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: Future.wait([chars, planets]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator(color: Colors.yellow));
          }
          return CharacterList(characters: snapshot.data![0], planets: snapshot.data![1]);
        },
      ),
    );
  }
}