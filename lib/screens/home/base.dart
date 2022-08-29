import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nobu/screens/home/new.dart';
import '../../domainModels/activity.dart';
import '../../providers/all_providers.dart';
import '../../providers/today_activities.dart';
import '../../widgets/activity_list_item.dart';
import '../../widgets/bottom_menu.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(todayActivitiesFuture).value;

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String today = date.toString().replaceAll("00:00:00.000", "");

    return Scaffold(
      appBar: AppBar(
        title: Text("${today} 今日のロビン"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                for (final activity in activities!)
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewActivity()),
          );
        },
        tooltip: 'Add new activity',
        icon: const Icon(Icons.add),
        label: const Text('のぶ何してる？')
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: const BottomMenu(button: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
