import 'package:flutter/material.dart';
import 'package:geduq_apps/app/data/utils/image_helper.dart';
import 'package:geduq_apps/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              opacity: _.step == 0 ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageHelper.imgLogoApkPng),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _.step == 0 ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageHelper.imgKemdikbudPng),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageHelper.imgLogoUiiPng),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
