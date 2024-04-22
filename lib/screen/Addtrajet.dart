import 'package:flutter/material.dart';
import 'package:go_and_go/NavBar/nav_bar.dart';
import 'package:go_and_go/screen/parametres.dart';
import 'package:get/get.dart';
import '../NavBar/nav_model.dart';
import 'groupe.dart';
import 'home.dart';


class addtrajet extends StatefulWidget {
  const addtrajet({Key? key}) : super(key: key);

  @override
  State<addtrajet> createState() => _addtrajetState();
}

class _addtrajetState extends State<addtrajet> {
  int _pageIndex = 1;
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
                  children: <Widget>[
                    Image.asset(
                      'assets/img/leaf.png',
                      width: 35,
                      height: 39,
                      fit: BoxFit.contain, // Choose a fit option
                    ),
                    SizedBox(width: 235),
                    Image.asset(
                      'assets/img/arcticons_verizon-messages.png',
                      width: 48,
                      height: 48,
                      fit: BoxFit.contain, // Choose a fit option
                    ),
                  ],
                )
            ),
            SizedBox(height: 25),


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
