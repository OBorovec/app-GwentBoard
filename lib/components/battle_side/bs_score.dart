import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';

class BattleSideScore extends StatelessWidget {
  const BattleSideScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattleSideBloc, BattleSideState>(
      builder: (context, state) {
        return Text(
          state.score.toString(),
          style: Theme.of(context).textTheme.headline6,
        );
      },
    );
  }
}
