import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashScreenViewOne extends StatefulWidget {
  const SplashScreenViewOne({super.key});

  @override
  State<SplashScreenViewOne> createState() => _SplashScreenViewOne();
}

class _SplashScreenViewOne extends State<SplashScreenViewOne> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Get.offNamed("/splash_two");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo_apk.png"),
              fit: BoxFit.cover
            ),
          ),
        ),
      ),
    );
  }
}