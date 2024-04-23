import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/request/car_model.dart';
import '../models/response/Car_Modelresp.dart';

import '../services/helpers/car_helper.dart';

class CarNotifier extends ChangeNotifier {

   late Future<List<CarModelResp>> caruser;

    List<CarModelReq> _cars = [];
    List<CarModelReq> get cars => _cars;

    final CarFormKey = GlobalKey<FormState>();

    bool validateAndSave() {
        final form = CarFormKey.currentState;

        if (form!.validate()) {
            form.save();
            return true;
        } else {
            return false;
        }
    }
  addCar(CarModelReq model) {
    CarHelper.addCar(model).then((response) {
      if (response==200) {
        Get.snackbar(
            "car successfully added", "Please Check your bookmarks",
      
            icon: const Icon(Icons.bookmark_add));
      } else if (response!=200) {
        Get.snackbar("Failed to add Bookmarks", "Please try again",

            backgroundColor: Colors.red,
            icon: const Icon(Icons.bookmark_add));
      }
    });
  }

 getCar() {
    caruser = CarHelper.getCars() as Future<List<CarModelResp>>;
  }

}



