import 'dart:convert';
import 'package:http/http.dart' as http;
import '../assets/constants.dart' as Constants;
import '../domainModels/activity.dart';

class ActivityRepository {
  Future <List<Activity>> fetchActivity() async {
    final response =
    await http.get(Uri.parse("${Constants.API_DOMAIN}/todos"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.take(10).map((data) => Activity.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
}