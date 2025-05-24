import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isCanPauseBackgroundAudio = false;

  setIsCanPauseBackgroundAudio(bool value) {
    isCanPauseBackgroundAudio = value;
    update();
  }

  int userId = (-1);
  String character = "";
  String currentUsername = "";
  int currentLevel = 1;
  int lifePoint = 5;
  int totalTimePreTest = 0;

  setCharacter(String value) {
    character = value;
    update();
  }

  setCurrentUsername(String value) {
    currentUsername = value;
    update();
  }

  resetAll() {
    userId = (-1);
    character = "";
    currentUsername = "";
    currentLevel = 1;
    lifePoint = 5;
    totalTimePreTest = 0;
    username.clear();
    update();
  }

  TextEditingController username = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
