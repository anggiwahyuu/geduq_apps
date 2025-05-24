import 'dart:convert';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/services.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class GameplayController extends GetxController {
  final HomeController _homeCtrl = Get.find();

  setIsCanPauseBackgroundAudio(bool value) {
    _homeCtrl.setIsCanPauseBackgroundAudio(value);
  }

  List<int> levelDone = [];

  List<int> levelCorrect = [];

  setLevelDone(int level) {
    levelDone.add(level);
    update();
  }

  setLevelCorrect(int level) {
    levelCorrect.add(level);
    update();
  }

  resetGameplayConfig() {
    _homeCtrl.resetAll();
    update();
  }

  int userId = (-1);
  String character = "";
  String currentUsername = "";
  int currentLevel = 1;
  int lifePoint = 5;
  int totalTimePreTest = 0;
  int score = 0;

  setCharacter() {
    character = _homeCtrl.character;
    update();
  }

  setCurrentUsername() {
    currentUsername = _homeCtrl.currentUsername;
    update();
  }

  addOrReduceScore({required bool isAdd, required int value}) {
    if (isAdd) {
      score += value;
    } else {
      score -= value;
    }
    update();
  }

  addOrReduceLifePoint({required bool isAdd}) {
    if (isAdd) {
      lifePoint++;
    } else {
      lifePoint--;
    }
    update();
  }

  setTimer(int value) {
    totalTimePreTest += value;
    update();
  }

  setAddCurrentLevel() {
    currentLevel++;
    update();
  }

  resetAll() {
    userId = (-1);
    character = "";
    currentUsername = "";
    currentLevel = 1;
    lifePoint = 5;
    totalTimePreTest = 0;
    score = 0;
    update();
  }

  List stageSambungAyatDone = [];
  List stageSusunAyatDone = [];
  List stageTebakArtiDone = [];
  List stageTebakSurahDone = [];
  List stageTebakArtiAyatDone = [];

  addStageSambungAyatDone(int level) {
    stageSambungAyatDone.add(level);
    dev.log("Added to Sambung Ayat Done");
    update();
  }

  addStageSusunAyatDone(int level) {
    stageSusunAyatDone.add(level);
    dev.log("Added to Susun Ayat Done");
    update();
  }

  addStageTebakArtiDone(int level) {
    stageTebakArtiDone.add(level);
    dev.log("Added to Tebak Arti Done");
    update();
  }

  addStageTebakSurahDone(int level) {
    stageTebakSurahDone.add(level);
    dev.log("Added to Tebak Surah Done");
    update();
  }

  addStageTebakArtiAyatDone(int level) {
    stageTebakArtiAyatDone.add(level);
    dev.log("Added to Tebak Arti Ayat Done");
    update();
  }

  List itemsArtiAyat = [];
  List optionArtiAyat = [];
  late int randomPickArtiAyat;

  Future<void> readArtiAyatJson() async {
    final response = await rootBundle.loadString("assets/json/arti_dari_ayat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);
    itemsArtiAyat = data["arti_dari_ayat"];
    randomPickArtiAyat = Random().nextInt(itemsArtiAyat.length);

    setRandomPickArtiAyat();
  }

  setRandomPickArtiAyat() {
    randomPickArtiAyat = Random().nextInt(itemsArtiAyat.length);

    while (stageTebakArtiAyatDone.contains(randomPickArtiAyat)) {
      dev.log("Level Done...");
      randomPickArtiAyat = Random().nextInt(itemsArtiAyat.length);
    }

    optionArtiAyat = itemsArtiAyat[randomPickArtiAyat]["options"];
    optionArtiAyat.shuffle();

    update();
  }

  List itemsSambungAyat = [];
  List optionSambungAyat = [];
  late int randomPickSambungAyat;

  Future<void> readSambungAyatJson() async {
    final response = await rootBundle.loadString("assets/json/sambung_ayat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);
    itemsSambungAyat = data["sambung_ayat"];
    randomPickSambungAyat = Random().nextInt(itemsSambungAyat.length);

    setRandomPickSambungAyat();
  }

  setRandomPickSambungAyat() {
    randomPickSambungAyat = Random().nextInt(itemsSambungAyat.length);

    while (stageSambungAyatDone.contains(randomPickSambungAyat)) {
      dev.log("Level Done...");
      randomPickSambungAyat = Random().nextInt(itemsSambungAyat.length);
    }

    optionSambungAyat = itemsSambungAyat[randomPickSambungAyat]["options"];
    optionSambungAyat.shuffle();

    update();
  }

  List itemsSusunAyat = [];
  List optionSusunAyat = [];
  late int randomPickSusunAyat;

  Future<void> readSusunAyatJson() async {
    final response = await rootBundle.loadString("assets/json/susun_ayat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);

    itemsSusunAyat = data["susun_ayat"];
    randomPickSusunAyat = Random().nextInt(itemsSusunAyat.length);

    setRandomPickSusunAyat();
  }

  setRandomPickSusunAyat() {
    randomPickSusunAyat = Random().nextInt(itemsSusunAyat.length);

    while (stageSusunAyatDone.contains(randomPickSusunAyat)) {
      dev.log("Level Done...");
      randomPickSusunAyat = Random().nextInt(itemsSusunAyat.length);
    }

    optionSusunAyat = itemsSusunAyat[randomPickSusunAyat]["options"];
    optionSusunAyat.shuffle();

    update();
  }

  setRemoveOptionSusunAyat(int index) {
    optionSusunAyat.removeAt(index);
    update();
  }

  setAddOptionSusunAyat(String value) {
    optionSusunAyat.add(value);
    update();
  }

  List itemsTebakArti = [];
  List optionTebakArti = [];
  late int randomPickTebakArti;

  Future<void> readTebakArtiJson() async {
    final response = await rootBundle.loadString("assets/json/arti_nama_surat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);

    itemsTebakArti = data["arti_nama_surat"];
    randomPickTebakArti = Random().nextInt(itemsTebakArti.length);

    setRandomPickTebakArti();
  }

  setRandomPickTebakArti() {
    randomPickTebakArti = Random().nextInt(itemsTebakArti.length);

    while (stageTebakArtiDone.contains(randomPickTebakArti)) {
      dev.log("Level Done...");
      randomPickTebakArti = Random().nextInt(itemsTebakArti.length);
    }

    optionTebakArti = itemsTebakArti[randomPickTebakArti]["options"];
    optionTebakArti.shuffle();

    update();
  }

  List itemsTebakSurah = [];
  List optionTebakSurah = [];
  late int randomPickTebakSurah;

  Future<void> readTebakSurahJson() async {
    final response = await rootBundle.loadString("assets/json/nama_surat_dari_ayat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);

    itemsTebakSurah = data["nama_surat_dari_ayat"];
    randomPickTebakSurah = Random().nextInt(itemsTebakSurah.length);

    setRandomPickTebakSurah();
  }

  setRandomPickTebakSurah() {
    randomPickTebakSurah = Random().nextInt(itemsTebakSurah.length);

    while (stageTebakSurahDone.contains(randomPickTebakSurah)) {
      dev.log("Level Done...");
      randomPickTebakSurah = Random().nextInt(itemsTebakSurah.length);
    }

    optionTebakSurah = itemsTebakSurah[randomPickTebakSurah]["options"];
    optionTebakSurah.shuffle();

    update();
  }

  List itemSejarah = [];
  List itemDoa = [];
  List itemAdab = [];
  List itemHikmah = [];

  late int randomPickSejarah;
  late int randomPickDoa;
  late int randomPickAdab;
  late int randomPickHikmah;

  bool materiVisibility = false;

  setMateriVisibility(bool value) {
    materiVisibility = value;
    update();
  }

  Future<void> readMateriJson() async {
    final response = await rootBundle.loadString("assets/json/materi.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);

    itemSejarah = data["sejarah_kebudayaan_islam"];
    itemDoa = data["doa_doa_harian"];
    itemAdab = data["adab_adab"];
    itemHikmah = data["hikmah"];

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

  @override
  void onInit() {
    super.onInit();
    setCharacter();
    setCurrentUsername();
    readArtiAyatJson();
    readSambungAyatJson();
    readSusunAyatJson();
    readTebakArtiJson();
    readTebakSurahJson();
    readMateriJson();
  }
}
