import 'dart:async';

import 'package:geduq_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  int step = 0;

  addStep() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      step++;
      update();
    });

    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onInit() {
    super.onInit();
    addStep();
  }
}
