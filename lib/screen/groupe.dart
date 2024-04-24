import 'package:flutter/material.dart';
import 'package:go_and_go/NavBar/nav_bar.dart';
import 'package:go_and_go/screen/parametres.dart';

import 'trajet.dart';
import 'home.dart';

class groupe extends StatefulWidget {
  const groupe({Key? key}) : super(key: key);

  @override
  State<groupe> createState() => _groupeState();
}

class _groupeState extends State<groupe> {
  int _pageIndex = 2;
  void _navigateToPage(int index) {
    setState(() {
      _pageIndex = index;
    });

    // Navigate to specific route based on index
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');

        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/addtrajet');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/groupe');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/parametres');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo1.png',
              fit: BoxFit.contain,
              width: 72,
              height: 55,
            ),

          ],

        ),
      ),
      body: Container(
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
            SizedBox(height: 80),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/savelive');
                      },
                      child: Container(
                        width: 35,
                        height: 39,
                        decoration: BoxDecoration(
                          // Définir la décoration de votre premier conteneur ici
                        ),
                        child: Image.asset(
                          'assets/img/leaf.png',
                          width: 35,
                          height: 39,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 235), // Espace entre les deux images
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/chat1');
                        // Mettez votre logique de navigation ici
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        child: Image.asset(
                          'assets/img/arcticons_verizon-messages.png',
                          width: 48,
                          height: 48,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 25),
            Container(
              width: 277,
              height: 51,
              child: Column(
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF00AA9B), // Couleur par défaut du texte
                        ),
                        children: [
                          TextSpan(
                            text: "Ça fait plaisir de vous revoir ",
                          ),
                          TextSpan(
                            text: "Aymen !",
                            style: TextStyle(
                              color: Color(0xFFF04641), // Couleur rouge pour "Go"
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),


          ],
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
          onPressed: () => debugPrint("Add Button pressed"),

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
        ),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: _pageIndex,
        onTap: _navigateToPage,

      ),




    );
  }
}

