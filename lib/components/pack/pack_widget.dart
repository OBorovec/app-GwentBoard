import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/pack/pack_bloc.dart';
import 'package:gwent_board/components/pack/pack_card_wrap.dart';
import 'package:gwent_board/components/pack/pack_control.dart';

class CardPack extends StatelessWidget {
  const CardPack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackBloc(),
      child: Row(
        children: const [
          Expanded(child: CardPackWrap()),
          PackContol(),
        ],
      ),
    );
  }
}
