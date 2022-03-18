import 'package:flutter/material.dart';
import 'package:trainee_app/data/model/movie_model.dart';

class MovieListWidget extends StatelessWidget {
  final void Function(Movie) onItemSelected;
  int? selected;
  List<Movie> movieList;

  MovieListWidget(
      {Key? key,
      this.selected,
      required this.onItemSelected,
      required this.movieList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${movieList[index].title} (${movieList[index].releaseDate})'),
            style: ListTileStyle.list,
            selected: index == selected,
            onTap: () {
              onItemSelected(movieList[index]);
            },
          );
        });
  }
}
