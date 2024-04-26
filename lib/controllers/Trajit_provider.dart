import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_and_go/screen/addTrajit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/request/car_model.dart';
import '../models/request/trajiReq_model.dart';
import '../models/response/Car_Modelresp.dart';

import '../models/response/trajitRes_Model.dart';
import '../services/helpers/Trajit_helper.dart';
import '../services/helpers/car_helper.dart';

class TrajitNotifier extends ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool _firstTime = true;

  bool get firstTime => _firstTime;

  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }

  bool? _entrypoint;

  bool get entrypoint => _entrypoint ?? false;

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }


  late Future<List<TrajitModelReq>> trajituser;

  List<TrajitModelReq> _trajit = [];

  List<TrajitModelReq> get trajit => _trajit;

  final TrajitFormKey = GlobalKey<FormState>();


  bool validateAndSave() {
    final form = TrajitFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  addRide(int userID, TrajitModelReq model) {
    TrajitHalper.addRides(userID, model).then((response) {
      if (response == 200) {
        Get.snackbar(
            "car successfully added", "Please Check y",

            icon: const Icon(Icons.safety_check));
      } else if (response != 200) {
        Get.snackbar("", "Please Check",

            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_add));
      }
    });
  }

  Future<CarModelResp> getTrajiByid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      return await CarHelper.getCars(token);
    } else {
      throw Exception("Token not found");
    }
  }

 /* Future<List<TrajitModelRes>> getallTraji() async {


    if (http.Response==200) {
      return await TrajitHalper.getAllRides();
    } else {
      throw Exception("conection failed");
    }
  }*/

}