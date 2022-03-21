import 'package:flutter/material.dart';
import 'package:gwent_board/components/_page/side_page.dart';

class FullBoardPage extends StatelessWidget {
  const FullBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidePage(
      body: Center(
        child: Text('Full board'),
      ),
    );
  }
}
