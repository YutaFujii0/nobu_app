import 'package:flutter/cupertino.dart';

@immutable
class Activity {
  const Activity({required this.id, this.description = "", this.datetime = ""});

  final String? id;
  final String description;
  final String datetime;

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'].toString(),
      description: json['title'],
      datetime: json['datetime'],
    );
  }
}
