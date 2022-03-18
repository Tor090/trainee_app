import 'package:trainee_app/data/model/movie_model.dart';

abstract class ListMovieEvent {}

class FetchListMovieEvent extends ListMovieEvent {
  FetchListMovieEvent();
}

class UpdateListMovieEvent extends ListMovieEvent {
  UpdateListMovieEvent();
}

class SelectMovieFromListEvent extends ListMovieEvent {
  SelectMovieFromListEvent(this.listMovie, this.selectMovie);

  List<Movie> listMovie;
  int selectMovie;
}

class ClearSelectEvent extends ListMovieEvent {
  ClearSelectEvent(this.listMovie);

  List<Movie> listMovie;
}
