import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainee_app/data/model/movie_model.dart';

class MovieRepositoryImpl {
  static const url = 'https://putsreq.com/VU1WlTm0nIufpSQ04w08';

  Future<List<Movie>> getMovieList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['movies'] as List;
      List<Movie> movieList =
          jsonResponse.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } else {
      throw Exception('Failed to load');
    }
  }
}
