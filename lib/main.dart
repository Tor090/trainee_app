import 'package:flutter/material.dart';
import 'package:trainee_app/features/home_screen/home_screen.dart';

import 'navigator/route_generator.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: HomeScreen.routeScreen,
      routes: {
        HomeScreen.routeScreen: (_) => const HomeScreen(),
        RouteGenerator.routeScreen: (_) => RouteGenerator(),
      },
    ),
  );
}
