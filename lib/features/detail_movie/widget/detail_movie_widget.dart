import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_app/features/detail_movie/bloc/detail_movie_bloc.dart';
import 'package:trainee_app/features/detail_movie/bloc/detail_movie_state.dart';

class DetailMovieWidget extends StatelessWidget {
  DetailMovieWidget({Key? key}) : super(key: key);

  //Movie? movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      builder: (BuildContext context, state) {
        if (state is LoadingState) {
          return CircularProgressIndicator();
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is LoadedState) {
          if (state.movie == null) {
            return Center(
              child: Text('No'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        state.movie!.posterPath,
                        height: 300,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    Text(
                      '${state.movie!.title} ${state.movie!.releaseDate}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.movie!.overview,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (movie == null) {
  //     return const Center(
  //       child: Text('No selection'),
  //     );
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.only(top: 8.0),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             ClipRRect(
  //               child: Image.network(
  //                 movie!.posterPath,
  //                 height: 300,
  //                 width: 200,
  //                 fit: BoxFit.fill,
  //               ),
  //               borderRadius: const BorderRadius.all(Radius.circular(20)),
  //             ),
  //             Text(
  //               '${movie!.title} ${movie!.releaseDate}',
  //               style:
  //                   const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               movie!.overview,
  //               style: const TextStyle(fontSize: 18),
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }
}
