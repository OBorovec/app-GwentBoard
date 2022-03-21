import 'package:flutter/material.dart';
import 'package:gwent_board/components/_page/root_page.dart';
import 'package:gwent_board/constants/colors.dart';
import 'package:gwent_board/route_generator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RootPage(
      body: Column(
        children: [
          Expanded(
            child: AppBoardOption(
              label: 'Full board',
              background: Theme.of(context).primaryColorLight,
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.fullBoard);
              },
            ),
          ),
          Expanded(
            child: AppBoardOption(
              label: 'Half board',
              background: Theme.of(context).primaryColorDark,
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.singleBoard);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AppBoardOption extends StatelessWidget {
  final String label;
  final Color background;
  final Function() onTap;
  const AppBoardOption({
    Key? key,
    required this.label,
    required this.onTap,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        color: background,
      ),
    );
  }
}
