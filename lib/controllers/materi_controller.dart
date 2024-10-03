import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MateriController extends GetxController {
  final itemSejarah = [].obs;
  final itemDoa = [].obs;
  final itemAdab = [].obs;
  final itemHikmah = [].obs;

  late int randomPickSejarah;
  late int randomPickDoa;
  late int randomPickAdab;
  late int randomPickHikmah;

  final materiVisibility = false.obs;

  @override
  void onInit() {
    readMateriJson();
    super.onInit();
  }

  Future<void> readMateriJson() async {
    final response = await rootBundle.loadString("assets/json/materi.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);

    itemSejarah.value = data["sejarah_kebudayaan_islam"];
    itemDoa.value = data["doa_doa_harian"];
    itemAdab.value = data["adab_adab"];
    itemHikmah.value = data["hikmah"];

    if (itemSejarah.isNotEmpty) {
      randomPickSejarah = Random().nextInt(itemSejarah.length);
    }
    
    if (itemDoa.isNotEmpty) {
      randomPickDoa = Random().nextInt(itemDoa.length);
    }

    if (itemAdab.isNotEmpty) {
      randomPickAdab = Random().nextInt(itemAdab.length);
    }
    
    if (itemHikmah.isNotEmpty) {
      randomPickHikmah = Random().nextInt(itemHikmah.length);
    }
  }
}