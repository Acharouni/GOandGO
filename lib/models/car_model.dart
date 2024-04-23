import 'dart:convert';

CarModel carModelFromJson(String str) => CarModel.fromJson(json.decode(str));

String carModelToJson(CarModel data) => json.encode(data.toJson());

class CarModel {
  final int power;
  final String brand;
  final String serialNumber;
  final String photo;

  CarModel({
    required this.power,
    required this.brand,
    required this.serialNumber,
    required this.photo,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    power: json["power"],
    brand: json["brand"],
    serialNumber: json["serialNumber"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "power": power,
    "brand": brand,
    "serialNumber": serialNumber,
    "photo": photo,
  };
}
