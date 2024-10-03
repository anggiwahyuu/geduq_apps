import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AyatMateriController extends GetxController {
  final itemsAlFatihah = [].obs;
  final itemsAdDhuha = [].obs;
  final itemsAtTin = [].obs;
  final itemsAlAlaq = [].obs;
  final itemsAlAsr = [].obs;
  final itemsAlMaun = [].obs;
  final itemsAlKautsar = [].obs;
  final itemsAnNasr = [].obs;
  final itemsAlIkhlas = [].obs;
  final itemsAlFalaq = [].obs;
  final itemsAnNaas = [].obs;

  @override
  void onInit() {
    super.onInit();
    readJson();
  }

  Future<void> readJson() async {
    final response = await rootBundle.loadString("assets/json/ayat_ayat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);

    itemsAlFatihah.value = data["al_fatihah"];
    itemsAdDhuha.value = data["ad_dhuha"];
    itemsAtTin.value = data["at_tin"];
    itemsAlAlaq.value = data["al_alaq"];
    itemsAlAsr.value = data["al_asr"];
    itemsAlMaun.value = data["al_maun"];
    itemsAlKautsar.value = data["al_kautsar"];
    itemsAnNasr.value = data["an_nasr"];
    itemsAlIkhlas.value = data["al_ikhlas"];
    itemsAlFalaq.value = data["al_falaq"];
    itemsAnNaas.value = data["an_naas"];
  }
}