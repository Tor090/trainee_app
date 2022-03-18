import 'package:flutter/material.dart';
import 'package:trainee_app/features/detail_movie/widget/detail_movie_widget.dart';

class DetailMovieScreen extends StatelessWidget {
  //final Movie movie;

  static const String routeScreen = '/detailMovieScreen';

  const DetailMovieScreen({
    Key? key,
    //required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Detail View'),
            ),
            body: DetailMovieWidget(),
          );
        } else {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            Navigator.pop(context);
          });

          return Container();
        }
      },
    );
  }
}
