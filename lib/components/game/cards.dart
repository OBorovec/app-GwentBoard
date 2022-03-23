import 'package:flutter/material.dart';
import 'package:gwent_board/constants/dimensions.dart';
import 'package:gwent_board/constants/gwent_icons.dart';
import 'package:gwent_board/model/card_data.dart';

class DraggableCard extends StatelessWidget {
  final CardData data;

  const DraggableCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<CardData>(
      data: data,
      child: BoardCard(data: data),
      feedback: Material(
        child: BoardCard(data: data),
        color: Colors.transparent,
      ),
    );
  }
}

class DoubleTapCard extends StatelessWidget {
  final CardData data;
  final Function() onDoubleTap;

  const DoubleTapCard({
    Key? key,
    required this.data,
    required this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: BoardCard(data: data),
    );
  }
}

class BoardCard extends StatelessWidget {
  const BoardCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CardData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(BoardDims.cardPadding),
      child: Container(
        width: BoardDims.cardWidth,
        height: BoardDims.cardHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          border: Border.all(
              color: !data.attGolden
                  ? Theme.of(context).primaryColorDark
                  : Colors.yellow.shade700,
              width: 2),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                data.activeValue != null
                    ? data.activeValue.toString()
                    : data.baseValue.toString(),
                style: TextStyle(color: _cardValueColor()),
              ),
            ),
            if (data.activeValue != null && data.activeValue != data.baseValue)
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  data.baseValue.toString(),
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: _buildCardIcon(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardIcon(BuildContext context) {
    if (data.attMoral) {
      return Icon(GwentIcons.moral);
    }
    if (data.attBrothers) {
      return Icon(GwentIcons.brother);
    }
    if (data.attGroup) {
      return Icon(GwentIcons.group);
    }
    if (data.attSupport) {
      return Icon(GwentIcons.support);
    }
    if (data.attDoubleSupport) {
      return Icon(GwentIcons.doubleSupport);
    }
    return Container();
  }

  Color? _cardValueColor() {
    if (data.activeValue != null) {
      if (data.activeValue! < data.baseValue) {
        return Colors.red;
      }
      if (data.activeValue! > data.baseValue) {
        return Colors.green;
      }
    }
    return null;
  }
}
