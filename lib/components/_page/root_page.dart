import 'package:flutter/material.dart';
import 'package:gwent_board/components/expandable_fab.dart';
import 'package:gwent_board/utils/toasting.dart';
import 'dart:io';

class RootPage extends StatefulWidget {
  final Widget body;

  const RootPage({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  DateTime currentBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: null,
        extendBody: true,
        body: Stack(
          children: [
            Positioned.fill(child: widget.body),
            Center(
              child: ExpandableFab(
                child: const Icon(Icons.menu),
                heroTag: 'menu_tag',
                distance: 96.0,
                alignment: Alignment.center,
                children: [
                  ActionButton(
                    onPressed: () =>
                        Toasting.notifyToast(context, "Not implemented yet..."),
                    icon: const Icon(Icons.info),
                  ),
                  ActionButton(
                    onPressed: () =>
                        Toasting.notifyToast(context, "Not implemented yet..."),
                    icon: const Icon(Icons.settings),
                  ),
                  ActionButton(
                    onPressed: () => exit(0),
                    icon: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    final DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toasting.notifyToast(context, 'Double tab to exit.');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
