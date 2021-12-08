import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;


class CRUDOperations {

  static Future<List> fetchAllTodos() async {
    final response = await http
        .get(Uri.parse('http://localhost:8080/todos'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load todo');
    }
  }

  static Future<bool> addItem(int id, String todo, String description) async {
    final response = await http
        .post(
          Uri.parse('http://localhost:8080/add-todo'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'id': id,
            'todo': todo,
            "description": description,
          }),
        );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteItem(int index) async {
    final response = await http
        .delete(Uri.parse('http://localhost:8080/delete-todo/$index'));
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      return true;
    } else {
      log(response.statusCode.toString());
      return false;
    }
  }

  static Future<bool> editItem(index, int id, String todo, String description) async {
    final response = await http
        .put(
        Uri.parse('http://localhost:8080/update-todo'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'todo': todo,
          "description": description,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
  }
}