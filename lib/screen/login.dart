import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 343,
              height: 593,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10000000149011612),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/logo/logo1.png',
                    width: 114,
                    height: 148,
                    fit: BoxFit.contain, // Choose a fit option
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        width: 311,
                        height: 48,
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ email ne doit pas être vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Votre Email/id",
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
                            prefixIcon: Icon(Icons.person, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Container(
                        width: 311,
                        height: 48,
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Le champ Password ne doit pas être vide';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Votre Mot de Passe",
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
                            prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Container(
                        child: Container(
                          width: 311,
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
                              // Actions à exécuter lorsque le bouton est pressé
                            },

                            child: Center(
                              child: Text(
                                'Se connecter',
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

                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: 268.76,
                        height: 44,
                        child: Text(
                          "Si vous rencontrez des difficultés, veuillez contacter",
                          style: const TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: 256,
                        height: 108,
                        child: Image.asset(
                          'assets/logo/logoinetum.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain, // Choose a fit option
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ),

    );
  }
}