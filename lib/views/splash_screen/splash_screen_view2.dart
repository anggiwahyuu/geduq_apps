import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenViewTwo extends StatefulWidget {
  const SplashScreenViewTwo({super.key});

  @override
  State<SplashScreenViewTwo> createState() => _SplashScreenViewTwo();
}

class _SplashScreenViewTwo extends State<SplashScreenViewTwo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Get.offNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/kemdikbud.png"),
                  fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo_uii.png"),
                  fit: BoxFit.cover
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}