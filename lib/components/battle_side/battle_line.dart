import 'package:flutter/material.dart';
import 'package:gwent_board/components/battle_side/card_line.dart';
import 'package:gwent_board/components/battle_side/moral_icon_switch.dart';
import 'package:gwent_board/components/game/weather_icon_switch.dart';

abstract class BattleLine extends StatelessWidget {
  final MoralIconSwitch moralSwitch;
  final CardLine cardLine;
  final WeatherIconSwitch weatherSwitch;

  const BattleLine({
    Key? key,
    required this.moralSwitch,
    required this.cardLine,
    required this.weatherSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        moralSwitch,
        Expanded(
          child: cardLine,
        ),
        weatherSwitch,
      ],
    );
  }
}

class FrontLine extends BattleLine {
  const FrontLine({
    Key? key,
  }) : super(
          key: key,
          moralSwitch: const FrontMoralIconSwitch(),
          cardLine: const FrontCardLine(),
          weatherSwitch: const SnowWeatherIconSwitch(),
        );
}

class BackLine extends BattleLine {
  const BackLine({
    Key? key,
  }) : super(
          key: key,
          moralSwitch: const BackMoralIconSwitch(),
          cardLine: const BackCardLine(),
          weatherSwitch: const FogWeatherIconSwitch(),
        );
}

class ArtyLine extends BattleLine {
  const ArtyLine({
    Key? key,
  }) : super(
          key: key,
          moralSwitch: const ArtyMoralIconSwitch(),
          cardLine: const ArtyCardLine(),
          weatherSwitch: const RainWeatherIconSwitch(),
        );
}
