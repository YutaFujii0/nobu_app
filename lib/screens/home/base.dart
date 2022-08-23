import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domainModels/activity.dart';
import '../../providers/today_activities.dard.dart';
import '../../widgets/activity_list_item.dart';
import '../../widgets/bottom_menu.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Activity> activities = ref.watch(todayActivitiesProvider);
    ref.read(todayActivitiesProvider.notifier).getAll();

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String today = date.toString().replaceAll("00:00:00.000", "");

    bool showNotch = true;
    FloatingActionButtonLocation fabLocation = FloatingActionButtonLocation.endDocked;

    return Scaffold(
      appBar: AppBar(
        title: Text("${today} 今日のロビン"),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                for (final activity in activities)
                  ActivityListItem(activity)
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: Column(
              children: const <Widget>[
                Text(
                  '今日はよく寝てる?',
                ),
                Text(
                  '今日は元気?',
                ),
              ]
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const activity = Activity(id: "11", description: "todo", datetime: "1011");
          ref.read(todayActivitiesProvider.notifier).addActivity(activity);
        },
        tooltip: 'Add new activity',
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
