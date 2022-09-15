import 'dart:convert';
import 'package:http/http.dart' as http;
import '../assets/constants.dart' as Constants;
import '../domainModels/activity.dart';

class ActivityRepository {
  Future<List<Activity>> fetchActivity() async {
    // final response = await http.get(Uri.parse("${Constants.API_DOMAIN}/todos"));
    final response = await http.get(Uri.parse("${Constants.API_DOMAIN}/activities"));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

      // https://stackoverflow.com/questions/71522236/flutter-type-listdynamic-is-not-a-subtype-of-type-listmodel
      return List<Activity>.from(
          jsonResponse['data'].map((data) => Activity.fromJson(data))
      );

      // Mock response
      // var input = jsonEncode(jsonObject);
      // List obj = jsonDecode(input);
      // return obj.map((data) => Activity.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<Activity>> create({activity: Activity}) async {
    // final response = await http.get(Uri.parse("${Constants.API_DOMAIN}/todos"));
    final response = await http.post(
      Uri.parse("${Constants.API_DOMAIN}/activities"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(activity),
    );
    // return jsonResponse.take(10).map((data) => Activity.fromJson(data)).toList();

    return await fetchActivity();

    // TODO: remove
    // var input = jsonEncode(jsonObject);
    // List obj = jsonDecode(input);
    // var array = obj.map((data) => Activity.fromJson(data)).toList();
    // array.add(activity);
    // return array;
  }
}

const jsonObject = [
  {
    "category":"起きた",
    "description":"起きた",
    "timestamp":"07:20"
  },
  {
    "category":"おしっこ",
    "description":"おしっこ",
    "timestamp":"07:22"
  },
  {
    "category":"ごはん",
    "description":"ご飯",
    "timestamp":"08:00"
  },
  {
    "category":"お水",
    "description":"お水",
    "timestamp":"09:43"
  },
  {
    "category":"寝た",
    "description":"寝た",
    "timestamp":"10:29"
  },
  {
    "category":"起きた",
    "description":"起きた",
    "timestamp":"11:00"
  },
  {
    "category":"ごはん",
    "description":"フード",
    "timestamp":"11:20"
  }
];