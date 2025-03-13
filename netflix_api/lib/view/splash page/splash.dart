import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_api/view/bottomNavBar/bottomNavbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 4350 ),()=>Navigator.push(context, MaterialPageRoute(builder: (context) => BottomPg(),)));
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: SafeArea(child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Lottie.asset("assets/netflix logo.json"),
        
      )),
    );
  }
}