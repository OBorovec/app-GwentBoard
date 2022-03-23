import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';
import 'package:gwent_board/bloc/pack/pack_bloc.dart';
import 'package:gwent_board/components/battle_side/battle_side_widget.dart';
import 'package:gwent_board/components/pack/pack_widget.dart';
import 'package:gwent_board/components/_page/board_page.dart';

class SingleBoardPage extends StatelessWidget {
  const SingleBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoardBasePage(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocProvider(
              create: (context) => PackBloc(),
              child: const CardPack(),
            ),
            BlocProvider(
              create: (context) => BattleSideBloc(),
              child: const BattleSide(
                showScore: true,
                allowWeatherControl: true,
                showWeather: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
