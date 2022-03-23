import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';
import 'package:gwent_board/bloc/game/game_bloc.dart';
import 'package:gwent_board/bloc/pack/pack_bloc.dart';
import 'package:gwent_board/components/_page/board_page.dart';
import 'package:gwent_board/components/battle_side/battle_side_widget.dart';
import 'package:gwent_board/components/game/game_score.dart';
import 'package:gwent_board/components/game/game_weather_control.dart';
import 'package:gwent_board/components/pack/pack_widget.dart';

class FullBoardPage extends StatelessWidget {
  const FullBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BattleSideBloc battleSideBlocA = BattleSideBloc();
    BattleSideBloc battleSideBlocB = BattleSideBloc();
    PackBloc packBloc = PackBloc();
    GameBloc gameBloc = GameBloc(
      battleSideBlocA: battleSideBlocA,
      battleSideBlocB: battleSideBlocB,
      packBloc: packBloc,
    );
    return BoardBasePage(
      body: BlocProvider(
        create: (context) => gameBloc,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: BlocProvider(
                  create: (context) => battleSideBlocA,
                  child: const BattleSide(
                    showReversed: true,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const GameScore(),
                  Expanded(
                    child: Column(
                      children: [
                        BlocProvider(
                          create: (context) => packBloc,
                          child: const CardPack(),
                        ),
                        const GameWeatherControl(),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: BlocProvider(
                  create: (context) => battleSideBlocB,
                  child: const BattleSide(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
