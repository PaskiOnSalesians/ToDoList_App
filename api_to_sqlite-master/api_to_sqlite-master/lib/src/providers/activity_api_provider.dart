import 'package:api_to_sqlite/src/models/activity_model.dart';
import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:dio/dio.dart';

class ActivityApiProvider {
  Future<List<Activity?>> getAllActivities() async {
    var url = "https://www.mockachino.com/6696a799-d2af-41/activity";
    Response response = await Dio().get(url);

    return (response.data as List).map((activity) {
      // ignore: avoid_print
      print("Inserting $activity");
      DBProvider.db.createActivity(Activity.fromJson(activity));
    }).toList();
  }
}
