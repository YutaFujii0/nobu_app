import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    this.button = false,
  });

  final bool? button;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            if (button!) const Spacer(),
            IconButton(
              tooltip: 'History',
              icon: const Icon(Icons.history),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Data',
              icon: const Icon(Icons.area_chart),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
