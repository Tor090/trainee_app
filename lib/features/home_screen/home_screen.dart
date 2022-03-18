import 'package:flutter/material.dart';
import 'package:trainee_app/navigator/route_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeScreen = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('MVVM'),
              onPressed: () {},
            ),
            ElevatedButton(
                child: const Text('Bloc'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RouteGenerator()));
                  // RouteGenerator.mainAppNav.currentState!
                  //     .pushNamed(RouteGenerator.routeScreen);
                }),
          ],
        ),
      ),
      //),
    );
  }
}
