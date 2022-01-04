import 'package:character_app/data/character.dart';
import 'package:character_app/data/planet.dart';
import 'package:character_app/logic/crud_operations.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  final List<Planet> planets;
  const CharacterList({Key? key, required this.characters, required this.planets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(character[1].name);
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.yellow,
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: ListTile(
              title: Text(
                characters[index].name,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              subtitle: Text(planets[int.parse(characters[index].homeWorld.substring(characters[index].homeWorld.length - 2, characters[index].homeWorld.length - 1))].name,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments:
                  planets[int.parse(characters[index].homeWorld.substring(characters[index].homeWorld.length - 2, characters[index].homeWorld.length - 1))]
                );
              },
            ),
          ),
        );
      },
    );
  }
}