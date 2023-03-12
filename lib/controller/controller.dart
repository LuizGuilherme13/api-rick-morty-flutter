import 'dart:convert';

import 'package:bottom_navigation/models/models.dart';
import 'package:bottom_navigation/repository/api_repository.dart';
import 'package:http/http.dart';

class Controller {
  final apiRepository = ApiRepository();

  Future<List<CharacterDTO>> fetchCharacters(int page) async {
    final Response response = await apiRepository.fetchCharacters(page);
    List<CharacterDTO> characters = [];

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      final List<dynamic> charactersResult = data["results"];

      characters = charactersResult
          .map((character) => CharacterDTO.fromJson(character))
          .toList();
    }

    return characters;
  }

  Future<List<Location>> fetchLocations() async {
    final Response response = await apiRepository.fetchLocations();
    List<Location> locations = [];

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      final List<dynamic> locationsResult = data["results"];

      //print(locationsResult);
      locations = locationsResult
          .map((location) => Location.fromJson(location))
          .toList();
    }

    return locations;
  }
}

final controller = Controller();
