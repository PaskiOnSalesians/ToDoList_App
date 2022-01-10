import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Activity {
  int? id;
  String? name;
  String? priority;

  Activity({
    this.id,
    this.name,
    this.priority,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "priority": priority,
  };
}
