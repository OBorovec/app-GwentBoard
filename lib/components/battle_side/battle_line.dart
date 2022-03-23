import 'package:flutter/material.dart';
import 'package:gwent_board/components/battle_side/card_line.dart';
import 'package:gwent_board/components/battle_side/moral_icon_switch.dart';
import 'package:gwent_board/components/battle_side/weather_icon_switch.dart';

abstract class BattleLine extends StatelessWidget {
  final MoralIconSwitch moralSwitch;
  final CardLine cardLine;
  final WeatherIconSwitch weatherSwitch;

  final bool showWeather;

  const BattleLine({
    Key? key,
    required this.moralSwitch,
    required this.cardLine,
    required this.weatherSwitch,
    this.showWeather = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        moralSwitch,
        Expanded(
          child: cardLine,
        ),
        if (showWeather) weatherSwitch,
      ],
    );
  }
}

class FrontLine extends BattleLine {
  FrontLine({
    Key? key,
    bool allowWeatherControl = false,
    bool showWeather = false,
  }) : super(
          key: key,
          moralSwitch: const FrontMoralIconSwitch(),
          cardLine: const FrontCardLine(),
          weatherSwitch: SnowWeatherIconSwitch(
            allowConrol: allowWeatherControl,
          ),
          showWeather: showWeather,
        );
}

class BackLine extends BattleLine {
  BackLine({
    Key? key,
    bool allowWeatherControl = false,
    bool showWeather = false,
  }) : super(
          key: key,
          moralSwitch: const BackMoralIconSwitch(),
          cardLine: const BackCardLine(),
          weatherSwitch: FogWeatherIconSwitch(
            allowConrol: allowWeatherControl,
          ),
          showWeather: showWeather,
        );
}

class ArtyLine extends BattleLine {
  ArtyLine({
    Key? key,
    bool allowWeatherControl = false,
    bool showWeather = false,
  }) : super(
          key: key,
          moralSwitch: const ArtyMoralIconSwitch(),
          cardLine: const ArtyCardLine(),
          weatherSwitch: RainWeatherIconSwitch(
            allowConrol: allowWeatherControl,
          ),
          showWeather: showWeather,
        );
}
