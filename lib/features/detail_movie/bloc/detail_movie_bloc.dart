import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_app/data/model/movie_model.dart';
import 'package:trainee_app/features/detail_movie/bloc/detail_movie_state.dart';

import 'detail_movie_event.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc() : super(LoadedState(null)) {
    on<SelectMovieEvent>(
        (event, emit) => selectMovie(event.listMovie, event.selectMovie));
    on<ClearSelectionEvent>((event, emit) => clearSelection());
  }

  void selectMovie(List<Movie> movieList, int movieId) {
    for (var movie in movieList) {
      if (movie.id == movieId) {
        Movie selectedMovie = movie;
        emit(LoadedState(selectedMovie));
      }
    }
  }

  void clearSelection() {
    emit(LoadedState());
  }
}
