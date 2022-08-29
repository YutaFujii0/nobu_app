// This file contains all providers
// Repository Providers are intentionally private to decouple repository layer from view layer

// repository providers
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nobu/domainModels/activity.dart';
import 'package:nobu/providers/today_activities.dart';
import 'package:nobu/repository/activity_repository.dart';

import 'activity_category_provider.dart';

final _activityRepositoryProvider = Provider<ActivityRepository>((ref) {
  return ActivityRepository();
});


// data providers
final todayActivitiesProvider = Provider<TodayActivitiesProvider>((ref) {
  final repo = ref.watch(_activityRepositoryProvider);
  return TodayActivitiesProvider(repo);
});


final activityCategoryProvider = StateNotifierProvider<ActivityCategoryNotifier, ActivityCategory?>((ref) {
  return ActivityCategoryNotifier();
});