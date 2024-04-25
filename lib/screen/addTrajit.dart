import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import '../controllers/Trajit_provider.dart';

class addtrajit extends StatefulWidget {
  const addtrajit({Key? key}) : super(key: key);

  @override
  State<addtrajit> createState() => _addtrajitState();
}

class _addtrajitState extends State<addtrajit> {
  final TextEditingController startLocation = TextEditingController();
  final TextEditingController finalDestination = TextEditingController();
  final TextEditingController numberOfSeats = TextEditingController();
  final TextEditingController photo = TextEditingController();
  late String userId = '';
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    debugPrint('decodedToken : $token');

    if (token != null) {
      Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
      setState(() {
        userId = decodedToken['firstName'] ?? '';
      });
    }
  }
  int _counter = 1;

  void _incrementCounter() {
    if (_counter < 4) {
      setState(() {
        _counter++;
      });
    }
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  TextEditingController _timeController = TextEditingController();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  bool isTodaySelected = false;
  bool isTomorrowSelected = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrajitNotifier>(
      create: (_) => TrajitNotifier(),
      child: Consumer<TrajitNotifier>(
        builder: (context, trajitNotifier, child) {
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
                    SizedBox(height: 75),
                    Form(
                      key: trajitNotifier.TrajitFormKey,
                      child: Column(
                        children: [
                          Container(
                            width: 311,
                            child: TextFormField(
                              //controller: _password,
                              style: TextStyle(color: Colors.black),
                              //obscureText: loginNotifier.obscureText,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Le champ Password ne doit pas être vide';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Votre point de depart",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical:
                                        16), // Ajuster la taille du champ de saisie
                                filled: true,
                                fillColor: Color(0xFFFCFFFD),
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  // Définir le style de la bordure quand le champ n'est pas en focus
                                  borderRadius: BorderRadius.circular(60),
                                  borderSide: BorderSide(
                                      color: Color(0xFFFCFFFD), width: 2),
                                ),
                                prefixIcon:
                                    Icon(Icons.location_on, color: Colors.red),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 311,
                            child: TextFormField(
                              //controller: _email,
                              style: TextStyle(color: Colors.black),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Le champ email ne doit pas être vide';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Votre point d'arrivage",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical:
                                        16), // Ajuster la taille du champ de saisie
                                filled: true,
                                fillColor: Color(0xFFFCFFFD),
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  // Définir le style de la bordure quand le champ n'est pas en focus
                                  borderRadius: BorderRadius.circular(60),
                                  borderSide: BorderSide(
                                      color: Color(0xFFFCFFFD), width: 2),
                                ),
                                prefixIcon:
                                    Icon(Icons.location_on, color: Colors.blue),
                              ),
                            ),
                          ),
                          SizedBox(height: 150),
                          Container(
                            width: 355,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month,
                                        color: Color(0xFF00AA9B)),
                                    Text(
                                      'Quand ?',
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                        color: Color(
                                            0xFF00AA9B), // Couleur par défaut du texte
                                      ),
                                    ),
                                    // Ajout d'un SizedBox pour l'espacement

                                    // Premier Container avec TextButton pour "Aujourd'hui"
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: isTodaySelected
                                            ? Color(0xFF00AA9B)
                                            : Color(
                                                0x33000000), // Couleur de fond du bouton "Modifier"
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            isTomorrowSelected = false;
                                            isTodaySelected =
                                                !isTodaySelected; // Toggle state
                                          });
                                        },
                                        child: Text(
                                          'Aujourd\'hui',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Ajout d'un SizedBox pour l'espacement

                                    // Deuxième Container avec TextButton pour "Demain"
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      width: 136,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: isTomorrowSelected
                                            ? Color(0xFF00AA9B)
                                            : Color(
                                                0x33000000), // Couleur de fond du bouton "Modifier"
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            isTomorrowSelected =
                                                !isTomorrowSelected;
                                            isTodaySelected =
                                                false; // Toggle state
                                          });
                                        },
                                        child: Text(
                                          'Demain',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_time_sharp,
                                            color: Color(0xFF00AA9B)),
                                        Text(
                                          'A quelle heure ? ',
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                                0xFF00AA9B), // Couleur par défaut du texte
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(1),
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Color(
                                                0xFF00AA9B), // Couleur de fond du bouton "Modifier"
                                          ),
                                          child: Expanded(
                                            child: TextFormField(
                                              controller: _timeController,
                                              readOnly: true,
                                              onTap: () {
                                                _selectTime(context);
                                              },
                                              decoration: InputDecoration(
                                                labelText: 'Select Time',
                                                border: InputBorder.none,
                                                suffixIcon:
                                                    Icon(Icons.access_time),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Icon(Icons.group_add_rounded,
                                            color: Color(0xFF00AA9B)),
                                        Text(
                                          'Places disponibles ?',
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                                0xFF00AA9B), // Couleur par défaut du texte
                                          ),
                                        ),
                                       Container(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      
    // Add spacing between elements
      IconButton(
        icon: Icon(Icons.remove),
        onPressed: _decrementCounter,
      ),
      
      Text(
        '$_counter',
        style: TextStyle(fontSize: 16),
      ),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
    ],
  ),
),
                                       SizedBox(height: 20),


                                      ],

                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [Color(0xFFFF52), Color(0xFF7400)],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),// Couleur de fond du bouton "Skip"
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.transparent, // Rendre la couleur de fond transparente
                                              onPrimary: Color(0xFFF00AA9B), // Couleur du texte
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                            ),
                                            onPressed: () {
                                              // Action à exécuter lorsque le bouton "Skip" est pressé
                                              Get.offAll(home());
                                            },
                                            child: Center(
                                              child: Text(
                                                'Annuler',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  shadows: [
                                                    Shadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black38,
                                                      offset: Offset(-5.0, 5.0),
                                                    ),
                                                  ],
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width:50, height: 16), // Espacement entre les boutons
                                        Container(
                                          width: 120,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [Color(0xFF005573), Color(0xFF00AA9B)],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.transparent, // Rendre la couleur de fond transparente
                                              onPrimary: Colors.white, // Couleur du texte
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                            ),
                                            onPressed: () {
                                              // Action à exécuter lorsque le bouton "Commencer" est pressé

                                            },
                                            child: Center(
                                              child: Text(
                                                'Publier',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  shadows: [
                                                    Shadow(
                                                      blurRadius: 10.0,
                                                      color: Colors.black38,
                                                      offset: Offset(-5.0, 5.0),
                                                    ),
                                                  ],
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /*TextFormField(
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
                              filled: true,
                              fillColor: Color(0xFFFCFFFD),
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide: BorderSide(
                                  color: Color(0xFFFCFFFD),
                                  width: 2,
                                ),
                              ),
                              prefixIcon: Icon(Icons.code, color: Colors.grey),
                            ),
                          ),*/

                          /*TextFormField(
                            controller: power,
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Le champ Énergie ne doit pas être vide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Émission de CO2",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Color(0xFFFCFFFD),
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide: BorderSide(
                                  color: Color(0xFFFCFFFD),
                                  width: 2,
                                ),
                              ),
                              prefixIcon: Icon(Icons.co2, color: Colors.grey),
                            ),
                          ),*/

                          /*TextFormField(
                            controller: photo,
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Le champ image ne doit pas être vide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Ajouter une photo de la voiture",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Color(0xFFFCFFFD),
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide: BorderSide(
                                  color: Color(0xFFFCFFFD),
                                  width: 2,
                                ),
                              ),
                              prefixIcon: Icon(Icons.photo, color: Colors.grey),
                            ),
                          ),*/
                          SizedBox(height: 150),
                          /*Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.offAll(regseterone());
                                },
                                child: Text('Précédent'),
                              ),
                              SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () {
                                  if (carNotifier.validateAndSave()) {
                                    CarModelReq model = CarModelReq(
                                      power: int.parse(power.text),
                                      brand: brand.text,
                                      serialNumber: serialNumber.text,
                                      photo: photo.text,
                                    );
                                    carNotifier.addCar(model);
                                    debugPrint('Car Saved $CarModelReq');
                                    //Get.offAll(regsterthree());
                                  } else {
                                    Get.defaultDialog(
                                      title: 'Erreur',
                                      middleText:
                                      'Le champ Émission de CO2 ne doit pas être vide.',
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  }
                                },
                                child: Text('Suivant'),
                              ),
                            ],
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
