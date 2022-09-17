import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nobu/repository/activity_repository.dart';

import '../domainModels/activity.dart';
import 'all_providers.dart';
import '../assets/constants.dart' as Constants;

class TodayActivitiesProvider {
  final ActivityRepository _repo;

  TodayActivitiesProvider(this._repo);

  Future<List<Activity>> getAll() async {
    return await _repo.fetchActivity();
  }

  void create({
    required description,
    required category,
  }) async {
    final activity = Activity(
      yourLove: Constants.NOBU,
      actionAt: DateTime.now().millisecondsSinceEpoch,
      category: category,
      description: description,
    );
    _repo.create(activity: activity);
  }
}

final todayActivitiesFuture = FutureProvider.autoDispose<List<Activity>>((ref) async {
  final activitiesProvider = ref.watch(todayActivitiesProvider);
  return await activitiesProvider.getAll();
});
