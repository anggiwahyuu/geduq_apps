import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geduq_apps/app/data/model/ayat_response.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:geduq_apps/app/modules/materi/widgets/materi_surah_view.dart';
import 'package:get/get.dart';

class MateriController extends GetxController {
  final HomeController _homeCtrl = Get.find();

  setIsCanPauseBackgroundAudio(bool value) {
    _homeCtrl.setIsCanPauseBackgroundAudio(value);
  }

  List<Widget> pagesMateri = [];

  List<Widget> materiOpened = [];

  SurahResponse surahResponse = SurahResponse();

  Future<void> readJson() async {
    final response = await rootBundle.loadString("assets/json/ayat_ayat.json");
    final encoded = utf8.encode(response);
    final decoded = utf8.decode(encoded);
    final data = await json.decode(decoded);

    surahResponse = SurahResponse.fromJson(data);

    Future.delayed(Duration.zero).then((value) {
      for (int i = 0; i < surahResponse.surah!.length; i++) {
        pagesMateri.add(MateriSurahView(
          data: surahResponse.surah![i],
          index: i,
        ));
      }
    });

    update();
  }

  addMateriOpened(int index) {
    materiOpened.add(pagesMateri[index]);
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await readJson();
  }
}
