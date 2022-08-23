import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domainModels/activity.dart';

class ActivityRepository {
  Future <List<Activity>> fetchActivity() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Activity.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
}