import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/pack/pack_bloc.dart';
import 'package:gwent_board/components/game/cards.dart';
import 'package:gwent_board/model/card_data.dart';

class CardPackWrap extends StatelessWidget {
  const CardPackWrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackBloc, PackState>(
      builder: (context, state) {
        return Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: (state.normalCards + state.goldCards)
              .map(
                (CardData cvd) => DraggableCard(data: cvd),
              )
              .toList(),
        );
      },
    );
  }
}
