import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

abstract class WeatherIconSwitch extends StatelessWidget {
  final String weatherIconOn;
  final String weatherIconOff;
  final double size;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;

  const WeatherIconSwitch({
    Key? key,
    required this.weatherIconOn,
    required this.weatherIconOff,
    this.size = 40,
    this.padding,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattleSideBloc, BattleSideState>(
      builder: (context, state) {
        final bool isOn = _getIsOn(state);
        List<Widget> weatherIcons = [
          _wrapIcon(context, isOn, weatherIconOn),
          _wrapIcon(context, !isOn, weatherIconOff),
        ];
        if (isOn) weatherIcons = weatherIcons.reversed.toList();
        return InkWell(
          onTap: () => _onTap(context),
          child: SizedBox(
            height: 50,
            width: 30,
            child: Stack(
              children: weatherIcons,
            ),
          ),
        );
      },
    );
  }

  Widget _wrapIcon(BuildContext context, bool isFront, String iconID) {
    return Align(
      alignment: isFront ? Alignment.topLeft : Alignment.bottomRight,
      child: Icon(
        WeatherIcons.fromString(iconID),
        color: isFront
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.onSecondary,
        size: isFront ? 30 : 15,
      ),
    );
  }

  bool _getIsOn(BattleSideState state);

  void _onTap(BuildContext context);
}

class SnowWeatherIconSwitch extends WeatherIconSwitch {
  const SnowWeatherIconSwitch({Key? key})
      : super(
          key: key,
          weatherIconOn: 'wi-snow',
          weatherIconOff: 'wi-day-sunny',
        );

  @override
  bool _getIsOn(BattleSideState state) {
    return state.frontlineWeather;
  }

  @override
  void _onTap(BuildContext context) {
    BlocProvider.of<BattleSideBloc>(context).add(ToggleFrontlineWeather());
  }
}

class FogWeatherIconSwitch extends WeatherIconSwitch {
  const FogWeatherIconSwitch({Key? key})
      : super(
          key: key,
          weatherIconOn: 'wi-fog',
          weatherIconOff: 'wi-day-sunny',
        );

  @override
  bool _getIsOn(BattleSideState state) {
    return state.backlineWeather;
  }

  @override
  void _onTap(BuildContext context) {
    BlocProvider.of<BattleSideBloc>(context).add(ToggleBacklineWeather());
  }
}

class RainWeatherIconSwitch extends WeatherIconSwitch {
  const RainWeatherIconSwitch({Key? key})
      : super(
          key: key,
          weatherIconOn: 'wi-rain',
          weatherIconOff: 'wi-day-sunny',
        );

  @override
  bool _getIsOn(BattleSideState state) {
    return state.artylineWeather;
  }

  @override
  void _onTap(BuildContext context) {
    BlocProvider.of<BattleSideBloc>(context).add(ToggleArtylineWeather());
  }
}
