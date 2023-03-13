import 'package:http/http.dart' as http;

class ApiRepository {
  String api = "https://rickandmortyapi.com/api/";

  Future<http.Response> fetchCharacters({String? query}) async {
    Uri uri = Uri.parse('$api$query');

    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8,'
    });
  }

  Future<http.Response> fetchLocations({String? query}) async {
    Uri uri = Uri.parse('$api$query');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8,'
    });
  }

  Future<http.Response> fetchEpisodes({String? query}) async {
    Uri uri = Uri.parse('$api$query');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8,'
    });
  }
}
