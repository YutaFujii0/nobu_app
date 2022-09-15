import 'dart:collection';

import 'package:flutter/cupertino.dart';

@immutable
class Activity {
  const Activity({
    required this.category,
    this.description = "",
    this.datetime = ""
  });

  final ActivityCategory category;
  final String description;
  final String datetime;

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      category: categoryMapper[json['category']]!,
      description: json['description'],
      datetime: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() => {
    'category': categoryMapperInvert[category],
    'description': description,
    'datetime': datetime,
  };

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

  static final LinkedHashMap categoryMapperInvert = LinkedHashMap.from({
    ActivityCategory.eat: "ごはん" ,
    ActivityCategory.drink: "お水" ,
    ActivityCategory.pee: "おしっこ" ,
    ActivityCategory.poop: "うんち" ,
    ActivityCategory.vomit: "吐いた" ,
    ActivityCategory.cry: "鳴いた" ,
    ActivityCategory.takeWalk: "さんぽ" ,
    ActivityCategory.sleep: "寝た" ,
    ActivityCategory.wakeUp: "起きた" ,
    ActivityCategory.goHospital: "病院" ,
    ActivityCategory.measureBodyTemp: "体温測った" ,
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

