import 'package:http/http.dart' as http;

class ApiRepository {
  String api = "https://rickandmortyapi.com/api/";

  Future<http.Response> fetchCharacters(int page) async {
    Uri uri = Uri.parse('$api/character/?page=$page');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8,'
    });
  }

  Future<http.Response> fetchLocations() async {
    Uri uri = Uri.parse('$api/location');
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8,'
    });
  }
}
