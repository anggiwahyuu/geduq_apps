import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController username = TextEditingController();

  bool isCanPauseBackgroundAudio = false;

  setIsCanPauseBackgroundAudio(bool value) {
    isCanPauseBackgroundAudio = value;
    update();
  }

  String character = "";
  String currentUsername = "";

  setCharacter(String value) {
    character = value;
    update();
  }

  setCurrentUsername(String value) {
    currentUsername = value;
    update();
  }

  resetAll() {
    character = "";
    currentUsername = "";
    username.clear();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    resetAll();
  }
}
