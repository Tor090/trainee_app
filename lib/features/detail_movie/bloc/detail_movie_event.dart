import 'package:trainee_app/data/model/movie_model.dart';

abstract class DetailMovieEvent {}

class SelectMovieEvent extends DetailMovieEvent {
  SelectMovieEvent(this.listMovie, this.selectMovie);

  List<Movie> listMovie;
  int selectMovie;
}

class ClearSelectionEvent extends DetailMovieEvent {
  ClearSelectionEvent();
}
