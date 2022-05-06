import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/game/game_bloc.dart';
import 'package:gwent_board/constants/gwent_icons.dart';

class GameControl extends StatelessWidget {
  const GameControl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              onPressed: () => BlocProvider.of<GameBloc>(context)
                ..add(
                  ScorchCards(),
                ),
              icon: ImageIcon(
                GwentIcons.scorch,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => BlocProvider.of<GameBloc>(context)
                ..add(
                  RestartGame(),
                ),
              icon: const Icon(Icons.restart_alt),
            ),
          ],
        );
      },
    );
  }
}
