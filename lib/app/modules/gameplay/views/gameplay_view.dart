import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/controller/audio_controllers.dart';
import 'package:geduq_apps/app/data/utils/image_helper.dart';
import 'package:geduq_apps/app/globalwidgets/background_game_1.dart';
import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_controller.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/game_ended/game_ended_pretest.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/insert_materi/materi_adab.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/insert_materi/materi_doa.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/insert_materi/materi_hikmah.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/insert_materi/materi_ski.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:geduq_apps/app/routes/app_pages.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/maps/map_active.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/maps/map_done_false.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/maps/map_done_true.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/maps/map_inactive.dart';
import 'package:get/get.dart';

class GameplayView extends GetView<GameplayController> {
  const GameplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameplayController>(builder: (_) {
      List<Widget> materiSection = [
        MateriSKI(isMateriVisible: true.obs),
        MateriDoa(isMateriVisible: true.obs),
        MateriAdab(isMateriVisible: true.obs),
        MateriHikmah(isMateriVisible: true.obs)
      ];

      return GetBuilder<AudioController>(builder: (audio) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                AlertDialog alert = AlertDialog(
                  title: const Text(
                    "Peringatan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: const SizedBox(
                    child: Text("Tindakan ini akan menghapus seluruh progress Anda. Apakah Anda yakin?"),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        "Batal",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _.resetGameplayConfig();

                        final homeCtrl = Get.find<HomeController>();
                        homeCtrl.resetAll();

                        Get.offNamed(Routes.HOME);
                      },
                      child: const Text(
                        "Ya",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                );

                showDialog(context: context, builder: (context) => alert);
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 25.w,
              ),
            ),
          ),
          body: Stack(
            children: [
              const BackgroundGame(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 4.w, left: 9.w),
                  width: 294.w,
                  height: 45.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(ImageHelper.imgMapPng), fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                bottom: 15.w,
                left: 1.w,
                child: _.levelDone.contains(1) && _.levelCorrect.contains(1)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(1) && !_.levelCorrect.contains(1)
                        ? const MapDoneFalse()
                        : MapActive(),
              ),
              Positioned(
                bottom: 25.w,
                left: 43.w,
                child: _.levelDone.contains(2) && _.levelCorrect.contains(2)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(2) && !_.levelCorrect.contains(2)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(1)
                            ? const MapInactive()
                            : _.levelDone.contains(1)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 3.w,
                left: 65.w,
                child: _.levelDone.contains(3) && _.levelCorrect.contains(3)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(3) && !_.levelCorrect.contains(3)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(2)
                            ? const MapInactive()
                            : _.levelDone.contains(2)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 13.w,
                left: 100.w,
                child: _.levelDone.contains(4) && _.levelCorrect.contains(4)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(4) && !_.levelCorrect.contains(4)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(3)
                            ? const MapInactive()
                            : _.levelDone.contains(3)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 42.w,
                left: 110.w,
                child: _.levelDone.contains(5) && _.levelCorrect.contains(5)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(5) && !_.levelCorrect.contains(5)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(4)
                            ? const MapInactive()
                            : _.levelDone.contains(4)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 28.w,
                left: 146.w,
                child: _.levelDone.contains(6) && _.levelCorrect.contains(6)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(6) && !_.levelCorrect.contains(6)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(5)
                            ? const MapInactive()
                            : _.levelDone.contains(5)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 12.w,
                left: 175.w,
                child: _.levelDone.contains(7) && _.levelCorrect.contains(7)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(7) && !_.levelCorrect.contains(7)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(6)
                            ? const MapInactive()
                            : _.levelDone.contains(6)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 33.w,
                left: 210.w,
                child: _.levelDone.contains(8) && _.levelCorrect.contains(8)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(8) && !_.levelCorrect.contains(8)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(7)
                            ? const MapInactive()
                            : _.levelDone.contains(7)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 22.w,
                left: 238.w,
                child: _.levelDone.contains(9) && _.levelCorrect.contains(9)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(9) && !_.levelCorrect.contains(9)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(8)
                            ? const MapInactive()
                            : _.levelDone.contains(8)
                                ? MapActive()
                                : SizedBox(),
              ),
              Positioned(
                bottom: 20.w,
                left: 288.w,
                child: _.levelDone.contains(10) && _.levelCorrect.contains(10)
                    ? const MapDoneTrue()
                    : _.levelDone.contains(10) && !_.levelCorrect.contains(10)
                        ? const MapDoneFalse()
                        : !_.levelDone.contains(9)
                            ? const MapInactive()
                            : _.levelDone.contains(9)
                                ? MapActive()
                                : SizedBox(),
              ),
              _.currentLevel != 1 && _.currentLevel % 2 != 0 && _.currentLevel <= 10
                  ? materiSection[Random().nextInt(materiSection.length)]
                  : const SizedBox(),
              GameEndedPreTest(),
            ],
          ),
        );
      });
    });
  }
}
