import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_and_go/screen/home.dart';
class regseterone extends StatefulWidget {
  const regseterone({Key? key}) : super(key: key);

  @override
  State<regseterone> createState() => _regseteroneState();
}

List<String> optionsV =['Oui','Non'];

class _regseteroneState extends State<regseterone> {
  String currentOptions=optionsV[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF232D4B),Color(0xFF005573)],
              begin:Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/img/Carimage1.png',
                    width: 400,
                    height: 300,
                    fit: BoxFit.contain, // Choose a fit option
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Column(
              children: [
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Couleur par défaut du texte
                      ),
                      children: [
                        TextSpan(
                          text: "Avez-vous une ",
                        ),
                        TextSpan(
                          text: "Voiture ",
                          style: TextStyle(
                            color: Color(0xFFF04641), // Couleur rouge pour "Go"
                          ),
                        ),
                        TextSpan(
                          text: "?",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Column(
              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: const Text("Oui"),
                    leading: Radio(
                      value: optionsV[0],
                      groupValue: currentOptions,
                      onChanged: (value){
                        setState(() {
                          currentOptions=value.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text("Non"),
                    leading: Radio(
                      value: optionsV[1],
                      groupValue: currentOptions,
                      onChanged: (value){
                        setState(() {
                          currentOptions=value.toString();
                        });
                      },
                    ),
                  ),

                ],
              )
              ],
            ),
            SizedBox(height: 40),
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
                    onPressed: () {Get.offAll(home());
                      // Action à exécuter lorsque le bouton "Skip" est pressé

                    },
                    child: Center(
                      child: Text(
                        'Skip',
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
                SizedBox(width:110, height: 16), // Espacement entre les boutons
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
                      print('Commencer button pressed');
                    },
                    child: Center(
                      child: Text(
                        'Suivant',
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
          ],
        ),
      ),
    );
  }
}