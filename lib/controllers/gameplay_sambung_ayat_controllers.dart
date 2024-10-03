import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:get/get.dart';

class SambungAyatController extends GetxController {
  final items = [].obs;
  final option = [].obs;
  late int randomPick;

  final GameController controller = Get.put(GameController());

  @override
  void onInit() {
    super.onInit();
    readJson();
  }

  Future<void> readJson() async {
    final response = await rootBundle.loadString("assets/json/sambung_ayat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);
    items.value = data["sambung_ayat"];
    randomPick = Random().nextInt(items.length);

    for (int i = 0; i < controller.stageSambungAyatDone.length; i++) {
      if (randomPick == controller.stageSambungAyatDone[i]) {
        randomPick = Random().nextInt(items.length);
      }
    }

    option.value = items[randomPick]["options"];
    option.shuffle();
  }
}