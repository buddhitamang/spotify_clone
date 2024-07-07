import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spotifyclone/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
             color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/dd.png'),
              fit: BoxFit.cover,

            ),
          ),
        ),
      ),
    );
  }
}
