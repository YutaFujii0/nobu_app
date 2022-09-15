import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nobu/repository/activity_repository.dart';

import '../domainModels/activity.dart';
import 'all_providers.dart';

class TodayActivitiesProvider {
  final ActivityRepository _repo;

  TodayActivitiesProvider(this._repo);

  Future<List<Activity>> getAll() async {
    return await _repo.fetchActivity();
  }

  Future<List<Activity>> create({
    required description,
    required category,
  }) async {
    final activity = Activity(
      category: category,
      description: description,
      datetime: DateTime.now().toString(),
    );
    return await _repo.create(activity: activity);
  }
}

final todayActivitiesFuture = FutureProvider.autoDispose<List<Activity>>((ref) async {
  final activitiesProvider = ref.watch(todayActivitiesProvider);
  return await activitiesProvider.getAll();
});
