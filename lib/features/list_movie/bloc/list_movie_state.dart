import 'package:trainee_app/data/model/movie_model.dart';

abstract class ListMovieState {}

class InitialState extends ListMovieState {}

class LoadingState extends ListMovieState {}

class LoadedState extends ListMovieState {
  LoadedState(this.movieList, [this.movieId]);

  final List<Movie> movieList;
  int? movieId;
}

class ErrorState extends ListMovieState {
  ErrorState(this.error);

  final String error;
}
