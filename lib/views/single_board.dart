import 'package:flutter/material.dart';
import 'package:gwent_board/components/battle_side/battle_side_widget.dart';
import 'package:gwent_board/components/pack/pack_widget.dart';
import 'package:gwent_board/components/_page/side_page.dart';

class SingleBoardPage extends StatelessWidget {
  const SingleBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidePage(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CardPack(),
          BattleSide(),
        ],
      ),
    );
  }
}
