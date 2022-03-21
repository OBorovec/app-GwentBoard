import 'package:flutter/material.dart';
import 'package:gwent_board/views/full_board.dart';
import 'package:gwent_board/views/home.dart';
import 'package:gwent_board/views/single_board.dart';

class RoutePaths {
  static const String home = '/';
  static const String singleBoard = '/single';
  static const String fullBoard = '/full';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;
    switch (settings.name) {
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutePaths.singleBoard:
        return MaterialPageRoute(builder: (_) => const SingleBoardPage());
      case RoutePaths.fullBoard:
        return MaterialPageRoute(builder: (_) => const FullBoardPage());
      // Default
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR 404'),
        ),
      );
    });
  }
}
