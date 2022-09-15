

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domainModels/activity.dart';
import '../../providers/all_providers.dart';

class NewActivity extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(activityCategoryProvider);
    final descriptionController = useTextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: Text("のぶ何した？"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (MapEntry e in Activity.categoryMapper.entries)
                  ListTile(
                    title: Text("${e.key}"),
                    leading: Radio<ActivityCategory>(
                      value: e.value,
                      groupValue: category,
                      onChanged: (ActivityCategory? value) {
                        ref.watch(activityCategoryProvider.notifier).setCategory(value);
                      },
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: TextField(
              controller: descriptionController,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        child: InkWell(
          onTap: () {
            ref.read(todayActivitiesProvider).create(description: descriptionController.text, category: category);
            Navigator.pop(context);
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                "追加",
              )
            )
          )
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}