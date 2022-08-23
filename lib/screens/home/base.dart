import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/counter.dart';
import '../../widgets/bottom_menu.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String today = date.toString().replaceAll("00:00:00.000", "");

    bool showFab = true;
    bool showNotch = true;
    FloatingActionButtonLocation fabLocation = FloatingActionButtonLocation.endDocked;

    return Scaffold(
      appBar: AppBar(
        title: Text(today),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomMenu(
        fabLocation: fabLocation,
        shape: showNotch ? const CircularNotchedRectangle() : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
