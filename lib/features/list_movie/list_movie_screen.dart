import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_app/features/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:trainee_app/features/detail_movie/bloc/detail_movie_event.dart';
import 'package:trainee_app/features/detail_movie/detail_movie_screen.dart';
import 'package:trainee_app/features/detail_movie/widget/detail_movie_widget.dart';
import 'package:trainee_app/features/list_movie/widget/list_movie_widget.dart';

import 'bloc/list_movie_bloc.dart';
import 'bloc/list_movie_event.dart';
import 'bloc/list_movie_state.dart';

class ListMovieScreen extends StatelessWidget {
  ListMovieScreen({Key? key}) : super(key: key);

  static const String routeScreen = '/listMovieScreen';

  //Movie? movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListMovieBloc, ListMovieState>(
      builder: (BuildContext context, state) {
        if (state is LoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is LoadedState) {
          return OrientationBuilder(
            builder: (context, orientation) => Scaffold(
              appBar: AppBar(
                actions: orientation == Orientation.landscape
                    ? [
                        TextButton(
                          child: const Text(
                            'CLEAR SELECTION',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            context
                                .read<DetailMovieBloc>()
                                .add(ClearSelectionEvent());
                          },
                        ),
                      ]
                    : null,
              ),
              body: RefreshIndicator(
                onRefresh: () async =>
                    context.read<ListMovieBloc>().add(UpdateListMovieEvent()),
                child: Flex(direction: Axis.horizontal, children: [
                  Flexible(
                    flex: 30,
                    child: MovieListWidget(
                        movieList: state.movieList,
                        selected: orientation == Orientation.portrait ||
                                state.movieId == null
                            ? null
                            : state.movieId! - 1,
                        onItemSelected: (selected) {
                          BlocProvider.of<DetailMovieBloc>(context).add(
                              SelectMovieEvent(state.movieList, selected.id));
                          BlocProvider.of<ListMovieBloc>(context).add(
                              SelectMovieFromListEvent(
                                  state.movieList, selected.id));
                          //RouteGenerator.navigatorKey.currentState!.pushNamed(
                          Navigator.pushNamed(
                              context, DetailMovieScreen.routeScreen);
                        }),
                  ),
                  if (orientation == Orientation.landscape)
                    Flexible(
                      flex: 70,
                      child: DetailMovieWidget(),
                    ),
                ]),
              ),
            ),
          );
        } else if (state is ErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.error),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
