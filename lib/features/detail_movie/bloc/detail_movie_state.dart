import 'package:trainee_app/data/model/movie_model.dart';

abstract class DetailMovieState {}

class InitialState extends DetailMovieState {}

class LoadingState extends DetailMovieState {}

class LoadedState extends DetailMovieState {
  LoadedState([this.movie]);

  final Movie? movie;
}

class ErrorState extends DetailMovieState {
  ErrorState(this.error);

  final String error;
}
