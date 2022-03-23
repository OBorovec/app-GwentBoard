import 'package:flutter/material.dart';

class BoardBasePage extends StatefulWidget {
  final Widget body;
  final List<IconButton> actionButtons;

  const BoardBasePage({
    Key? key,
    required this.body,
    this.actionButtons = const <IconButton>[],
  }) : super(key: key);

  @override
  State<BoardBasePage> createState() => _BoardBasePageState();
}

class _BoardBasePageState extends State<BoardBasePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: null,
        body: widget.body,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            _onWillPop().then((value) {
              if (value) Navigator.of(context).pop();
            });
          },
          child: const Icon(Icons.cancel),
          heroTag: 'menu_tag',
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Leaving board'),
            content: const Text('Do you want to exit current board?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
