import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';

abstract class MoralIconSwitch extends StatelessWidget {
  const MoralIconSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattleSideBloc, BattleSideState>(
      builder: (context, state) {
        final bool isOn = _getIsOn(state);
        return InkWell(
          onTap: () => _onTap(context),
          child: SizedBox(
            height: 50,
            width: 30,
            child: Icon(
              Icons.bookmark,
              color: isOn
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        );
      },
    );
  }

  bool _getIsOn(BattleSideState state);

  void _onTap(BuildContext context);
}

class FrontMoralIconSwitch extends MoralIconSwitch {
  const FrontMoralIconSwitch({Key? key}) : super(key: key);

  @override
  bool _getIsOn(BattleSideState state) {
    return state.frontlineMorale;
  }

  @override
  void _onTap(BuildContext context) {
    BlocProvider.of<BattleSideBloc>(context).add(ToggleFrontlineMorale());
  }
}

class BackMoralIconSwitch extends MoralIconSwitch {
  const BackMoralIconSwitch({Key? key}) : super(key: key);

  @override
  bool _getIsOn(BattleSideState state) {
    return state.backlineMorale;
  }

  @override
  void _onTap(BuildContext context) {
    BlocProvider.of<BattleSideBloc>(context).add(ToggleBacklineMorale());
  }
}

class ArtyMoralIconSwitch extends MoralIconSwitch {
  const ArtyMoralIconSwitch({Key? key}) : super(key: key);

  @override
  bool _getIsOn(BattleSideState state) {
    return state.artylineMorale;
  }

  @override
  void _onTap(BuildContext context) {
    BlocProvider.of<BattleSideBloc>(context).add(ToggleArtylineMorale());
  }
}
