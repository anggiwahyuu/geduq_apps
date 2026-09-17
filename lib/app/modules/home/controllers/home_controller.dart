import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController username = TextEditingController();

  bool isCanPauseBackgroundAudio = false;

  void setIsCanPauseBackgroundAudio(bool value) {
    isCanPauseBackgroundAudio = value;
    update();
  }

  String character = "";
  String currentUsername = "";

  void setCharacter(String value) {
    character = value;
    update();
  }

  void setCurrentUsername(String value) {
    currentUsername = value;
    update();
  }

  void resetAll() {
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
