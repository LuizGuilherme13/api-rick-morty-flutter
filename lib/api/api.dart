import 'dart:convert';
import 'package:bottom_navigation/models/models.dart';
import 'package:http/http.dart' as http;

Future<List<Result>> fetchCharacter() async {
  try {
    List<Result> results = [];
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    print(response.body);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      decode.forEach((item) => results.add(Result.fromJson(item)));

      return results;
    } else {
      throw Exception('Failed to load character');
    }
  } catch (e) {
    throw Exception('Failed to load character');
  }
}
