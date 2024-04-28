import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/request/auth/DemandeReq.dart';
import '../models/response/DemandeRes.dart';



class DemandeNotifier extends ChangeNotifier {

  Future<DemandeReq> addDemand(int userId, int rideId) async {
    /*final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/demand/add/$userId/$rideId'),
    );*/
    final String apiUrl = 'http://10.0.2.2:3000/demand/add/$userId/$rideId';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      // Assurez-vous que Ride a une méthode toJson() pour le sérialiser en JSON
    );
    if (response.statusCode == 200) {
      return DemandeReq.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add demand');
    }
  }
  Future<DemandeReq> changeDemandStatus(int id, String status) async {
    /**final response = await http.put(
      Uri.parse('http://10.0.2.3:3000/demand/changeDemandStatus/$id/$status'),
    );*/
    final String apiUrl = 'http://10.0.2.3:3000/demand/changeDemandStatus/$id/$status';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      // Assurez-vous que Ride a une méthode toJson() pour le sérialiser en JSON
    );
    if (response.statusCode == 200) {
      return DemandeReq.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to change demand status');
    }
  }

  Future<DemandeRes> getSelectedDemand(int id) async {
    /**final response = await http.get(
      Uri.parse('http://10.0.2.3:3000/demand/getSelectedDemand/$id'),
    );*/
    final String apiUrl = 'http://10.0.2.3:3000/demand/getSelectedDemand/$id';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      // Assurez-vous que Ride a une méthode toJson() pour le sérialiser en JSON
    );
    if (response.statusCode == 200) {
      return DemandeRes.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get selected demand');
    }
  }

  Future<List<DemandeRes>> getAllDemandsForTheRideCreator(int id) async {
    final String apiUrl = 'http://10.0.2.3:3000/demand/getAllDemandsForTheRideCreator/$id';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      // Assurez-vous que Ride a une méthode toJson() pour le sérialiser en JSON
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => DemandeRes.fromJson(item)).toList();
    } else {
      throw Exception('Failed to get all demands for the ride creator');
    }
  }
}