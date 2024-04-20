import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_and_go/screen/login.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_)=> const loginScreen(),
      ));
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            Image.asset(
              'assets/logo/logo2.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain, // Choose a fit option
            ),
            SizedBox(height: 20),
            Text(
             '''  Find Your Partner
     Destination With Us''',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
