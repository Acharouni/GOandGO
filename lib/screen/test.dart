/*import 'package:flutter/material.dart';
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
                body: ChangeNotifierProvider<CarNotifier>(
                  create: (_) => CarNotifier(), // Créer une instance de CarNotifier
                  child: Consumer<CarNotifier>(
                    builder: (context, carNotifier, child) {
                      // Accéder aux données de CarNotifier à l'intérieur du Consumer
                      return FutureBuilder<CarModelResp>(
                        future: carNotifier.getCar(), // Appeler la méthode pour récupérer une voiture
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            // Afficher un indicateur de chargement pendant le chargement des données
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            // Gérer les erreurs de chargement des données
                            return Center(child: Text('Erreur de chargement : ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            // Afficher les détails de la voiture une fois les données chargées
                            CarModelResp car = snapshot.data!;
                            return Container(
                              width: 323,
                              height: 281,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/img/votreV.png',
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(width: 71, height: 24),
                                  Text(
                                    'Modèle: ${car.brand}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      height: 18.75 / 15, // Calcul de la hauteur de ligne adaptative
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(width: 151, height: 24),
                                  Text(
                                    'Serie: ${car.serialNumber}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      height: 18.75 / 15, // Calcul de la hauteur de ligne adaptative
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(width: 71, height: 24),
                                  Text(
                                    'Co2: ${car.power}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      height: 18.75 / 15, // Calcul de la hauteur de ligne adaptative
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(height: 10), // Espacement entre le texte "Énergie" et les boutons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        width: 136,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Couleur de fond du bouton "Supprimer"
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            carNotifier.deleteCar(car.id, 'votre_jwt_token');
                                            Get.offAll(home());
                                          },
                                          child: Text(
                                            'Supprimer',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF00AA9B),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Center(child: Text('Aucune donnée de voiture disponible'));
                          }

                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
*//*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers/cars_provider.dart'; // Assurez-vous d'importer le bon chemin
import '../screens/add_car.dart'; // Importez la page addCar
import '../screens/add_trajit.dart'; // Importez la page addTrajit

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CarNotifier>(
      create: (_) => CarNotifier(),
      child: Consumer<CarNotifier>(
        builder: (context, carNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Ma Voiture'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (carNotifier.cars.isEmpty) {
                    // S'il n'y a pas de voitures, redirige vers la page addCar
                    Get.offAll(AddCar()); // Remplacez AddCar() par le nom de votre classe de page addCar
                  } else {
                    // S'il y a des voitures, redirige vers la page addTrajit
                    Get.offAll(AddTrajit()); // Remplacez AddTrajit() par le nom de votre classe de page addTrajit
                  }
                },
                child: Text('Ajouter une Trajit'), // Texte du bouton
              ),
            ),
          );
        },
      ),
    );
  }
}*//*

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers/cars_provider.dart'; // Assurez-vous d'importer le bon chemin
import '../models/response/car_model_resp.dart'; // Assurez-vous d'importer le bon chemin
import 'add_car.dart'; // Importez la page addCar
import 'add_trajit.dart'; // Importez la page addTrajit

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CarNotifier>(
      create: (_) => CarNotifier(),
      child: Consumer<CarNotifier>(
        builder: (context, carNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Ma Voiture'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Récupérer les détails de la voiture
                  CarModelResp? car = await carNotifier.getCar();
                  if (car == null) {
                    // S'il n'y a pas de voitures, afficher un snackbar et naviguer vers la page addCar
                    Get.snackbar(
                      "Aucune voiture",
                      "Veuillez ajouter une voiture",
                      backgroundColor: Colors.white38,
                      icon: const Icon(Icons.bookmark_add),
                    );
                    Get.offAll(AddCar()); // Naviguer vers la page addCar
                  } else {
                    // S'il y a des voitures, naviguer vers la page addTrajit
                    Get.offAll(AddTrajit()); // Naviguer vers la page addTrajit
                  }
                },
                child: Text('Ajouter une Trajit'),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 64,
              width: 64,
              child: FloatingActionButton(
                backgroundColor: Colors.white.withOpacity(0.5),
                elevation: 0,
                onPressed: () {
                  // Gérer l'action du FloatingActionButton en fonction de la présence de voitures
                  if (carNotifier.cars.isEmpty) {
                    // S'il n'y a pas de voitures, afficher un snackbar et naviguer vers la page addCar
                    Get.snackbar(
                      "Aucune voiture",
                      "Veuillez ajouter une voiture",
                      backgroundColor: Colors.white38,
                      icon: const Icon(Icons.bookmark_add),
                    );
                    Get.offAll(AddCar()); // Naviguer vers la page addCar
                  } else {
                    // S'il y a des voitures, naviguer vers la page addTrajit
                    Get.offAll(AddTrajit()); // Naviguer vers la page addTrajit
                  }
                },
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

FutureBuilder<CarModelResp>(
                    future: carNotifier.getCar(), // Appeler la méthode pour récupérer une voiture
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Afficher un indicateur de chargement pendant le chargement des données
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        // Gérer les erreurs de chargement des données
                        return Center(child: Text('Erreur de chargement : ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        // Afficher les détails de la voiture une fois les données chargées
                        CarModelResp car = snapshot.data!;
                        return CarModelResp car = snapshot.data!;
                      );
                      }
                    },
                  ),

floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
floatingActionButton: FutureBuilder<CarModelResp>(
  future: carNotifier.getCar(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      // Afficher un indicateur de chargement pendant le chargement des données
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      // Gérer les erreurs de chargement des données
      return Center(child: Text('Erreur de chargement : ${snapshot.error}'));
    } else if (snapshot.hasData) {
      // Récupérer la voiture à partir du snapshot
      CarModelResp car = snapshot.data!;
      // Afficher les détails de la voiture une fois les données chargées
      return FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.5),
        elevation: 0,
        onPressed: () {
          if (car == null) {
            // S'il n'y a pas de voiture, afficher un snackbar et naviguer vers la page addCar
            Get.snackbar(
              "Aucune voiture",
              "Veuillez ajouter une voiture",
              backgroundColor: Colors.white38,
              icon: const Icon(Icons.bookmark_add),
            );
            Get.offAll(RegisterTwo()); // Naviguer vers la page addCar (RegisterTwo)
          } else {
            // S'il y a une voiture, naviguer vers la page addTrajit
            Get.offAll(AddTrajit()); // Naviguer vers la page addTrajit (AddTrajit)
          }
        },
       shape: StarBorder.polygon(
            sides: 6,
            side: const BorderSide(width: 2, color: Colors.white),
            pointRounding: 0.3,
          ),
          /*RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.green),
              borderRadius: BorderRadius.circular(15),
            ),*/
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
      );
    } else {
      // Si aucune donnée n'est disponible, retourner un widget vide ou autre chose selon votre besoin
      return Container();
    }
  },
),
*/