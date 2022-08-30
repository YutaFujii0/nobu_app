import 'dart:collection';

import 'package:flutter/cupertino.dart';

@immutable
class Activity {
  const Activity({
    required this.id,
    required this.category,
    this.description = "",
    this.datetime = ""
  });

  final String? id;
  final ActivityCategory category;
  final String description;
  final String datetime;

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'].toString(),
      category: categoryMapper[json['category']]!,
      description: json['title'],
      datetime: json['datetime'],
    );
  }

  static final LinkedHashMap categoryMapper = LinkedHashMap.from({
    "ごはん": ActivityCategory.eat,
    "お水": ActivityCategory.drink,
    "おしっこ": ActivityCategory.pee,
    "うんち": ActivityCategory.poop,
    "吐いた": ActivityCategory.vomit,
    "鳴いた": ActivityCategory.cry,
    "さんぽ": ActivityCategory.takeWalk,
    "寝た": ActivityCategory.sleep,
    "起きた": ActivityCategory.wakeUp,
    "病院": ActivityCategory.goHospital,
    "体温測った": ActivityCategory.measureBodyTemp,
  });
}

enum ActivityCategory {
  eat,
  drink,
  pee, // おしっこ
  poop, // うんち
  vomit,
  cry,
  takeWalk,
  sleep,
  wakeUp,
  goHospital,
  measureBodyTemp,
}

