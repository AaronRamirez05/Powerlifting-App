import 'dart:convert';

List<Workouts> postFJson(String str) =>
    List<Workouts>.from(json.decode(str).map((x) => Workouts.fromJson(x)));

String postTJson(List<Workouts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Workouts {
  int Day;
  String WorkoutName;
  String SRRWeek1;
  String SRRWeek2;
  String SRRWeek3;
  String SRRWeek4;
  String ProgramName;
  String UserId;

  Workouts({
    required this.Day,
    required this.WorkoutName,
    required this.SRRWeek1,
    required this.SRRWeek2,
    required this.SRRWeek3,
    required this.SRRWeek4,
    required this.ProgramName,
    required this.UserId,
  });

  factory Workouts.fromJson(Map<String, dynamic> json) => Workouts(
      Day: json["day"],
      WorkoutName: json["workoutName"],
      SRRWeek1: json["srrWeek1"],
      SRRWeek2: json["srrWeek2"],
      SRRWeek3: json["srrWeek3"],
      SRRWeek4: json["srrWeek4"],
      ProgramName: json["programName"],
      UserId: json["userId"]);

  Map<String, dynamic> toJson() => {
        "Day": Day,
        "WorkoutName": WorkoutName,
        "SRRWeek1": SRRWeek1,
        "SRRWeek2": SRRWeek2,
        "SRRWeek3": SRRWeek3,
        "SRRWeek4": SRRWeek4,
        "ProgramName": ProgramName,
        "UserId": UserId
      };
}
