import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers/Cars_provider.dart';
import 'Regster1.dart';
import 'Regster3.dart';
import 'home.dart';

class ResgisterTwo extends StatefulWidget {
  const ResgisterTwo({Key? key}) : super(key: key);

  @override
  _ResgisterTwoState createState() => _ResgisterTwoState();
}

class _ResgisterTwoState extends State<ResgisterTwo> {
  final TextEditingController power = TextEditingController();
  final TextEditingController brand = TextEditingController();
  final TextEditingController serialNumber = TextEditingController();
  final TextEditingController photo = TextEditingController();

  @override
  void dispose() {
    power.dispose();
    brand.dispose();
    serialNumber.dispose();
    photo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarNotifier>(
      builder: (context, carNotifier, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF232D4B), Color(0xFF005573)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/img/Carsimage2.png',
                          width: 298,
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "Inscrivez-vous pour Commencer !",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 44,
                        child: Text(
                          "Information sur les Voitures ",
                          style: const TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFF04641),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: brand,
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ Modèle ne doit pas être vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Modèle",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            filled: true,
                            fillColor: Color(0xFFFCFFFD),
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide: BorderSide(color: Color(0xFFFCFFFD), width: 2),
                            ),
                            prefixIcon: Icon(Icons.directions_car, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 20), // Adding spacing between form fields
                        TextFormField(
                          controller: serialNumber,
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ Série ne doit pas être vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Série N° *** Tn ***",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            filled: true,
                            fillColor: Color(0xFFFCFFFD),
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide: BorderSide(color: Color(0xFFFCFFFD), width: 2),
                            ),
                            prefixIcon: Icon(Icons.code, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 20), // Adding spacing between form fields
                        TextFormField(
                          controller: power,
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ Énergie ne doit pas être vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Emission de CO2",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            filled: true,
                            fillColor: Color(0xFFFCFFFD),
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide: BorderSide(color: Color(0xFFFCFFFD), width: 2),
                            ),
                            prefixIcon: Icon(Icons.co2, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 20), // Adding spacing between form fields
                        TextFormField(
                          controller: photo,
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ image ne doit pas être vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Add Photo of Car",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            filled: true,
                            fillColor: Color(0xFFFCFFFD),
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide: BorderSide(color: Color(0xFFFCFFFD), width: 2),
                            ),
                            prefixIcon: Icon(Icons.photo, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
