import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  int remainingTimes = 0;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTimes++;
      update();
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
