import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gwent_board/bloc/battle_side/battle_side_bloc.dart';
import 'package:gwent_board/bloc/pack/pack_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final BattleSideBloc battleSideBlocA;
  final BattleSideBloc battleSideBlocB;
  final PackBloc packBloc;

  late final StreamSubscription _battleSideBlocASub;
  late final StreamSubscription _battleSideBlocBSub;

  GameBloc({
    required this.battleSideBlocA,
    required this.battleSideBlocB,
    required this.packBloc,
  }) : super(const GameState()) {
    _battleSideBlocASub =
        battleSideBlocA.stream.listen(_onBattleSideBlocAChange);
    _battleSideBlocBSub =
        battleSideBlocB.stream.listen(_onBattleSideBlocBChange);
    on<ToggleFrostWeather>(_toggleFrostWeather);
    on<UpdateScoreA>(_updateScoreA);
    on<UpdateScoreB>(_updateScoreB);
    on<ToggleFogWeather>(_toggleFogWeather);
    on<ToggleRainWeather>(_toggleRainWeather);
  }

  void _onBattleSideBlocAChange(BattleSideState battleState) {
    add(UpdateScoreA(newScore: battleState.score));
  }

  void _onBattleSideBlocBChange(BattleSideState battleState) {
    add(UpdateScoreB(newScore: battleState.score));
  }

  FutureOr<void> _updateScoreA(
    UpdateScoreA event,
    Emitter<GameState> emit,
  ) {
    emit(state.copyWith(scoreA: event.newScore));
  }

  FutureOr<void> _updateScoreB(
    UpdateScoreB event,
    Emitter<GameState> emit,
  ) {
    emit(state.copyWith(scoreB: event.newScore));
  }

  FutureOr<void> _toggleFrostWeather(
    ToggleFrostWeather event,
    Emitter<GameState> emit,
  ) {
    final bool newValue = !state.isFrost;
    battleSideBlocA.add(SetFrontlineWeather(value: newValue));
    battleSideBlocB.add(SetFrontlineWeather(value: newValue));
    emit(state.copyWith(isFrost: newValue));
  }

  FutureOr<void> _toggleFogWeather(
    ToggleFogWeather event,
    Emitter<GameState> emit,
  ) {
    final bool newValue = !state.isFog;
    battleSideBlocA.add(SetBacklineWeather(value: newValue));
    battleSideBlocB.add(SetBacklineWeather(value: newValue));
    emit(state.copyWith(isFog: newValue));
  }

  FutureOr<void> _toggleRainWeather(
    ToggleRainWeather event,
    Emitter<GameState> emit,
  ) {
    final bool newValue = !state.isRain;
    battleSideBlocA.add(SetArtylineWeather(value: newValue));
    battleSideBlocB.add(SetArtylineWeather(value: newValue));
    emit(state.copyWith(isRain: newValue));
  }

  @override
  Future<void> close() {
    _battleSideBlocASub.cancel();
    _battleSideBlocBSub.cancel();
    return super.close();
  }
}
