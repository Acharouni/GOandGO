import 'dart:convert';

TrajitModelReq trajitModelReqFromJson(String str) => TrajitModelReq.fromJson(json.decode(str));

String trajitModelReqToJson(TrajitModelReq data) => json.encode(data.toJson());

class TrajitModelReq {
  final String startLocation;
  final String finalDestination;
  final int numberOfSeats;
  final bool femaleOnly;
  final int consumption;
  final int goingOffTime;

  TrajitModelReq({
    required this.startLocation,
    required this.finalDestination,
    required this.numberOfSeats,
    required this.femaleOnly,
    required this.consumption,
    required this.goingOffTime,
  });

  factory TrajitModelReq.fromJson(Map<String, dynamic> json) => TrajitModelReq(
    startLocation: json["startLocation"],
    finalDestination: json["finalDestination"],
    numberOfSeats: json["numberOfSeats"],
    femaleOnly: json["femaleOnly"],
    consumption: json["consumption"],
    goingOffTime: json["goingOffTime"],
  );

  Map<String, dynamic> toJson() => {
    "startLocation": startLocation,
    "finalDestination": finalDestination,
    "numberOfSeats": numberOfSeats,
    "femaleOnly": femaleOnly,
    "consumption": consumption,
    "goingOffTime": goingOffTime,
  };
}
