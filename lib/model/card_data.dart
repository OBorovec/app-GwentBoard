import 'package:equatable/equatable.dart';

class CardData extends Equatable {
  final DateTime? initTime;
  final int baseValue;
  final int? activeValue;
  final bool attGroup;
  final bool attBrothers;
  final bool attSupport;
  final bool attDoubleSupport;
  final bool attMoral;
  final bool attGolden;

  const CardData({
    this.initTime,
    required this.baseValue,
    this.activeValue,
    this.attGroup = false,
    this.attBrothers = false,
    this.attSupport = false,
    this.attDoubleSupport = false,
    this.attMoral = false,
    this.attGolden = false,
  });

  @override
  List<Object?> get props => [initTime];

  CardData copyWith({
    DateTime? initTime,
    int? baseValue,
    int? activeValue,
    bool? attGroup,
    bool? attBrothers,
    bool? attSupport,
    bool? attDoubleSupport,
    bool? attMoral,
    bool? attGolden,
  }) {
    return CardData(
      initTime: initTime ?? this.initTime,
      baseValue: baseValue ?? this.baseValue,
      activeValue: activeValue ?? this.activeValue,
      attGroup: attGroup ?? this.attGroup,
      attBrothers: attBrothers ?? this.attBrothers,
      attSupport: attSupport ?? this.attSupport,
      attDoubleSupport: attDoubleSupport ?? this.attDoubleSupport,
      attMoral: attMoral ?? this.attMoral,
      attGolden: attGolden ?? this.attGolden,
    );
  }
}
