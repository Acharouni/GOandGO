import 'package:flutter/material.dart';

class regsterthree extends StatefulWidget {
  const regsterthree({Key? key}) : super(key: key);

  @override
  State<regsterthree> createState() => _regsterthreeState();
}
List<String> optionsV =['Oui','Non'];

class _regsterthreeState extends State<regsterthree> {
  String currentOptions=optionsV[0];
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
          child:  Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/img/Carsimage2.png',
                      width: 298,
                      height: 300,
                      fit: BoxFit.contain, // Choose a fit option
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
                          color: Colors.white, // Couleur par défaut du texte
                        ),
                        children: [
                          TextSpan(
                            text: "Inscrivez-vous pour Commencer !",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
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
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 311,
                    height: 48,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Le champ Adresse du Domicile ne doit pas être vide';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Adresse du Domicile",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Ajuster la taille du champ de saisie
                        filled: true,
                        fillColor: Color(0xFFFCFFFD),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder( // Définir le style de la bordure quand le champ n'est pas en focus
                          borderRadius: BorderRadius.circular(60),
                          borderSide: BorderSide(color: Color(0xFFFCFFFD), width: 2),
                        ),
                        prefixIcon: Icon(Icons.home, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [

                  Container(
                    width: 325,
                    height: 99,
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
                            text: "Acceptez-vous le live",
                          ),
                          TextSpan(
                            text: "Tacking ",
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
              SizedBox(height: 16),
              Column(
                children: [
                  Column(
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
                        print('Skip button pressed');
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