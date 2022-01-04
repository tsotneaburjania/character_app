import 'dart:convert';
import 'dart:developer';

import 'package:character_app/data/character.dart';
import 'package:character_app/data/planet.dart';
import 'package:http/http.dart' as http;


class CRUDOperations {

  static Future<List<Character>> fetchAllCharacters(http.Client client) async {
    final response =
    await client.get(Uri.parse('https://swapi.dev/api/people/'));

    return parseCharacter(response.body);
  }

  static Future<List<Planet>> fetchAllPlanets(http.Client client) async {
    final response =
    await client.get(Uri.parse('https://swapi.dev/api/planets'));

    return parsePlanet(response.body);
  }

  static List<Character> parseCharacter(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<String,dynamic>();
    List<Character> chars = parsed["results"].map<Character>((json) => Character.fromJson(json)).toList();
    return chars;
  }

  static List<Planet> parsePlanet(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<String,dynamic>();
    List<Planet> planets = parsed["results"].map<Planet>((json) => Planet.fromJson(json)).toList();
    return planets;
  }

  static Future<String> getPlanetName(http.Client client, String planetURL) async {
    final response =
        await client.get(Uri.parse(planetURL));
    final parsed = jsonDecode(response.body).cast<String,dynamic>();
    return parsed["name"];
  }

}