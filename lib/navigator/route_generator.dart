import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_app/data/repository/movie_repository_impl.dart';
import 'package:trainee_app/features/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:trainee_app/features/detail_movie/detail_movie_screen.dart';
import 'package:trainee_app/features/list_movie/bloc/list_movie_bloc.dart';
import 'package:trainee_app/features/list_movie/bloc/list_movie_event.dart';
import 'package:trainee_app/features/list_movie/list_movie_screen.dart';

class RouteGenerator extends StatelessWidget {
  RouteGenerator({Key? key}) : super(key: key);

  static const String routeScreen = 'RouteGenerator';
  static GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await _navigatorKey.currentState?.maybePop();
        return shouldPop == null ? true : !shouldPop;
      },
      child: MultiBlocProvider(
          providers: [
            BlocProvider<ListMovieBloc>(
                create: (_) => ListMovieBloc(MovieRepositoryImpl())
                  ..add(FetchListMovieEvent())),
            BlocProvider<DetailMovieBloc>(create: (_) => DetailMovieBloc())
          ],
          child: Navigator(
            key: _navigatorKey,
            initialRoute: ListMovieScreen.routeScreen,
            onGenerateRoute: (RouteSettings settings) {
              Widget builder;
              switch (settings.name) {
                case DetailMovieScreen.routeScreen:
                  builder = DetailMovieScreen();
                  break;
                case ListMovieScreen.routeScreen:
                default:
                  builder = ListMovieScreen();
                  break;
              }
              // return MaterialPageRoute(
              //   builder: builder,
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => builder,
              );
            },
          )),
    );
  }
}
