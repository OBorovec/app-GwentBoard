import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';
import 'package:gwent_board/components/battle_side/battle_line.dart';
import 'package:gwent_board/components/battle_side/battle_side_score.dart';

class BattleSide extends StatelessWidget {
  const BattleSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BattleSideBloc(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Frontline'),
          FrontLine(),
          Text('Backline'),
          BackLine(),
          Text('Artilery'),
          ArtyLine(),
          Divider(),
          BattleSideScore(),
        ],
      ),
    );
  }
}
