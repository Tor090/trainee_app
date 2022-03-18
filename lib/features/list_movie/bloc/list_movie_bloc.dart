import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_app/data/model/movie_model.dart';
import 'package:trainee_app/data/repository/movie_repository_impl.dart';
import 'package:trainee_app/features/list_movie/bloc/list_movie_event.dart';
import 'package:trainee_app/features/list_movie/bloc/list_movie_state.dart';

class ListMovieBloc extends Bloc<ListMovieEvent, ListMovieState> {
  ListMovieBloc(this._movieRepository) : super(InitialState()) {
    on<FetchListMovieEvent>((event, emit) => _getMovieList());
    on<SelectMovieFromListEvent>(
        (event, emit) => _selectMovie(event.listMovie, event.selectMovie));
    on<ClearSelectEvent>((event, emit) => _clearSelection(event.listMovie));
    on<UpdateListMovieEvent>((event, emit) => _updateListMovie());
  }

  final MovieRepositoryImpl _movieRepository;

  Future<void> _updateListMovie() async {
    emit(LoadingState());
    try {
      List<Movie> listMovie = await _movieRepository.getMovieList();
      emit(LoadedState(listMovie));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> _getMovieList() async {
    emit(LoadingState());
    try {
      List<Movie> movieList = await _movieRepository.getMovieList();
      emit(LoadedState(movieList));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void _selectMovie(List<Movie> movieList, int movieId) {
    emit(LoadedState(movieList, movieId));
  }

  void _clearSelection(List<Movie> movieList) {
    emit(LoadedState(movieList));
  }
}
