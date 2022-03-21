import 'package:flutter/material.dart';
import 'package:gwent_board/components/pack/pack_icon_switch.dart';

class PackContol extends StatelessWidget {
  const PackContol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MoralIconSwitch(),
            SupportIconSwitch(),
          ],
        ),
        Row(
          children: [
            BrotherIconSwitch(),
            DoubleSupportIconSwitch(),
          ],
        ),
      ],
    );
  }
}
