import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domainModels/activity.dart';

class ActivityCategoryNotifier extends StateNotifier<ActivityCategory?> {

  ActivityCategoryNotifier() : super(null);

  void setCategory(ActivityCategory? category) {
    state = category;
  }
}
