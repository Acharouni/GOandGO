import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/request/auth/DemandeReq.dart';



class DemandeNotifier extends ChangeNotifier {

  Future<DemandeReq> addDemand(int userId, int rideId) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/demand/add/$userId/$rideId'),
    );
    if (response.statusCode == 200) {
      return DemandeReq.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add demand');
    }
  }
}