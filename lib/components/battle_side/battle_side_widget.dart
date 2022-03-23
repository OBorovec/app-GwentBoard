import 'package:flutter/material.dart';
import 'package:gwent_board/components/battle_side/battle_line.dart';
import 'package:gwent_board/components/battle_side/battle_side_score.dart';

class BattleSide extends StatelessWidget {
  final bool showScore;
  final bool allowWeatherControl;
  final bool showWeather;
  final bool showReversed;
  const BattleSide({
    Key? key,
    this.showScore = false,
    this.allowWeatherControl = false,
    this.showWeather = false,
    this.showReversed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> columnContent = [
      const Text('Frontline'),
      FrontLine(
        allowWeatherControl: allowWeatherControl,
        showWeather: showWeather,
      ),
      const Text('Backline'),
      BackLine(
        allowWeatherControl: allowWeatherControl,
        showWeather: showWeather,
      ),
      const Text('Artilery'),
      ArtyLine(
        allowWeatherControl: allowWeatherControl,
        showWeather: showWeather,
      ),
      if (showScore) const Divider(),
      if (showScore) const BattleSideScore(),
    ];
    if (showReversed) columnContent = columnContent.reversed.toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: columnContent,
    );
  }
}
