import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nobu/repository/activity_repository.dart';

import '../domainModels/activity.dart';

class TodayActivitiesNotifier extends StateNotifier<List<Activity>> {
  TodayActivitiesNotifier(): super([]);

  final repo = ActivityRepository();

//  fetching
  void addActivity(Activity activity) {
    state = [...state, activity];
  }

  void getAll() async {
    state = await repo.fetchActivity();
  }
}

final todayActivitiesProvider = StateNotifierProvider<TodayActivitiesNotifier, List<Activity>>((ref) {
  return TodayActivitiesNotifier();
});
