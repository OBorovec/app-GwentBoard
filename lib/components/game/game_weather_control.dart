import 'package:flutter/material.dart';
import 'package:gwent_board/components/game/weather_icon_switch.dart';

class GameWeatherControl extends StatelessWidget {
  const GameWeatherControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FrostWeatherSwitch(),
        FogWeatherSwitch(),
        RainWeatherSwitch(),
      ],
    );
  }
}
