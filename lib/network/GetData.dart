import 'dart:convert';
import 'dart:developer';
import 'package:housy_assignment2/models/MoviesItemModel.dart';
import 'package:http/http.dart' as http;

class GetData {
  static Future<List<MoviesItemModel>> getMovies() async {
    List<MoviesItemModel> list = [];
    final response = await http.post(
      Uri.parse('https://hoblist.com/movieList'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "category": "movies",
        "language": "hindi",
        "genre": "all",
        "sort": "voting"
      }),
    );

    final body = json.decode(response.body)['result'] as List;
    return body.map((item) => MoviesItemModel.fromJson(item)).toList();
  }
}
