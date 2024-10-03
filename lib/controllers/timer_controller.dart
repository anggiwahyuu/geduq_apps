import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  final remainingTimes = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTimes.value++;
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}