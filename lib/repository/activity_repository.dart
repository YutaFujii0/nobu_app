import 'dart:convert';
import 'package:http/http.dart' as http;
import '../assets/constants.dart' as Constants;
import '../domainModels/activity.dart';

class ActivityRepository {
  Future <List<Activity>> fetchActivity() async {
    final response = await http.get(Uri.parse("${Constants.API_DOMAIN}/todos"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // TODO: uncomment
      // return jsonResponse.take(10).map((data) => Activity.fromJson(data)).toList();

      // TODO: remove
      var input = jsonEncode(jsonObject);
      List obj = jsonDecode(input);
      return obj.map((data) => Activity.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List<Activity>> create({activity: Activity}) async {
    final response = await http.get(Uri.parse("${Constants.API_DOMAIN}/todos"));
    // return jsonResponse.take(10).map((data) => Activity.fromJson(data)).toList();

    // TODO: remove
    var input = jsonEncode(jsonObject);
    List obj = jsonDecode(input);
    var array = obj.map((data) => Activity.fromJson(data)).toList();
    array.add(activity);
    return array;
  }
}

const jsonObject = [
  {
    "id": 1,
    "title":"起きた",
    "datetime":"07:20"
  },
  {
    "id": 1,
    "title":"おしっこ",
    "datetime":"07:22"
  },
  {
    "id": 1,
    "title":"ご飯",
    "datetime":"08:00"
  },
  {
    "id": 1,
    "title":"お水",
    "datetime":"09:43"
  },
  {
    "id": 1,
    "title":"寝た",
    "datetime":"10:29"
  },
  {
    "id": 1,
    "title":"起きた",
    "datetime":"11:00"
  },
  {
    "id": 1,
    "title":"フード",
    "datetime":"11:20"
  }
];