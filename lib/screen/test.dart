import 'package:flutter/material.dart';
import 'package:go_and_go/controllers/Trajit_provider.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../NavBar/nav_bar.dart';
import '../controllers/demande_provider.dart';
import '../models/response/trajitRes_Model.dart';
import '../services/helpers/Trajit_helper.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late int userId;
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
        userId = decodedToken['user'] ?? '';
      });
    }
  }
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
    return ChangeNotifierProvider<TrajitNotifier>(
        create: (_) => TrajitNotifier(),
        child: Consumer<TrajitNotifier>(
        builder: (context, trajitNotifier, child) {
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
                    FutureBuilder<List<TrajitModelRes>>(
                      future: TrajitHalper.getAllRidesForTodayAndTomorrow(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Erreur de chargement : ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          List<TrajitModelRes> rideList = snapshot.data!;
                          return Container(
                            height: 600,
                            width: 360,


                            child: ListView.builder(
                              itemCount: rideList.length,
                              itemBuilder: (context, index) {
                                TrajitModelRes trajit = rideList[index];
                                return Container(

                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Image.asset(
                                            'assets/img/profil.png',
                                            fit: BoxFit.contain,
                                            width: 72,
                                            height: 55,
                                          ),
                                          Text(' ${trajit.creator.firstName}  ${trajit.creator.lastName}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.07,
                                            ),),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text('De ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.07,
                                                ),),
                                              Text('${trajit.startLocation} ',
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.07,
                                                ),),
                                              Text('à ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.07,
                                                ),),
                                              Text(' ${trajit.finalDestination}',
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.07,
                                                ),),
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Row(
                                            children: [
                                              Text('Places :',
                                                style: TextStyle(
                                                  color: Color(0xffFFFFFF),
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.07,
                                                ),),
                                              Text(' ${trajit.numberOfSeats}',
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.07,
                                                ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 25 ),
                                      Row(
                                        children: [
                                          Text('Jour :',
                                            style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.07,
                                            ),),
                                          Text('${trajit.day} ',
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.07,
                                            ),),
                                        ],
                                      ),
                                      SizedBox(height: 25),
                                      Row(
                                        children: [
                                          Text('Heure : ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.07,
                                            ),),
                                          Text('${trajit.goingOffTime}',
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              height: 0.07,
                                            ),),
                                        ],
                                      ),

                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(
                                              0xFF00AA9B),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.all(12.0),
                                          textStyle: const TextStyle(fontSize: 16),
                                        ),
                                        onPressed: () {
                                          /*DemandeNotifier.addDemand(userId, rideId).then((DemandeReq) {
                                            // La demande a été ajoutée avec succès
                                            // Vous pouvez mettre à jour l'interface utilisateur ou effectuer d'autres actions nécessaires
                                          }).catchError((error) {
                                            // Une erreur s'est produite lors de l'ajout de la demande
                                            // Vous pouvez afficher un message d'erreur ou gérer l'erreur de manière appropriée
                                            print('Erreur lors de l\'ajout de la demande: $error');
                                          });*/
                                        },
                                        child: Text('Demande',),

                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );

                        } else {
                          return Center(child: Text('Aucune donnée de voiture disponible'));
                        }
                      },
                    ),
                    SizedBox(height: 200),

                  ],
                ),
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

        },
        ),
    );

  }
}