import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';
import 'package:gwent_board/bloc/game/game_bloc.dart';
import 'package:gwent_board/bloc/pack/pack_bloc.dart';
import 'package:gwent_board/components/battle_side/bs_score.dart';
import 'package:gwent_board/components/battle_side/bs_widget.dart';
import 'package:gwent_board/components/game/game_control_weather.dart';
import 'package:gwent_board/components/pack/pack_widget.dart';
import 'package:gwent_board/components/_page/pop_fltbtn_page.dart';

class SingleBoardPage extends StatelessWidget {
  const SingleBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Battleside blbc B is there jsut cause i ma lazy to create a new game bloc
    BattleSideBloc battleSideBlocA = BattleSideBloc();
    BattleSideBloc battleSideBlocB = BattleSideBloc();
    PackBloc packBloc = PackBloc();
    GameBloc gameBloc = GameBloc(
      battleSideBlocA: battleSideBlocA,
      battleSideBlocB: battleSideBlocB,
      packBloc: packBloc,
    );
    return PopFltBtnPage(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => gameBloc,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocProvider(
                create: (context) => packBloc,
                child: const CardPack(),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(child: GameWeatherControl()),
                    const VerticalDivider(),
                    IconButton(
                      onPressed: () => gameBloc.add(ScorchCards()),
                      icon: const ImageIcon(
                        AssetImage('assets/icons/scull.png'),
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () => gameBloc.add(
                        RestartGame(),
                      ),
                      icon: const Icon(Icons.restart_alt),
                    ),
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => battleSideBlocA,
                child: Column(
                  children: const [
                    BattleSide(),
                    Divider(),
                    BattleSideScore(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
