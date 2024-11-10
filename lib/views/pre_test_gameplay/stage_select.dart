import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/controllers/materi_controller.dart';
import 'package:geduq_apps/views/components/background_game_1.dart';
import 'package:geduq_apps/views/components/game_ended_pretest.dart';
import 'package:geduq_apps/views/components/map_active.dart';
import 'package:geduq_apps/views/components/map_done_false.dart';
import 'package:geduq_apps/views/components/map_done_true.dart';
import 'package:geduq_apps/views/components/map_inactive.dart';
import 'package:geduq_apps/views/components/materi_adab.dart';
import 'package:geduq_apps/views/components/materi_doa.dart';
import 'package:geduq_apps/views/components/materi_hikmah.dart';
import 'package:geduq_apps/views/components/materi_ski.dart';
import 'package:get/get.dart';

class StageSelect extends StatelessWidget {
  StageSelect({super.key});

  final GameController controller = Get.put(GameController());

  final MateriController materiController = Get.put(MateriController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        AlertDialog alert = AlertDialog(
          title: const Text(
            "Peringatan",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const SizedBox(
            child: Text(
                "Tindakan ini akan menghapus seluruh progress Anda. Apakah Anda yakin?"),
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
                controller.character.value = "";
                controller.currentUsername.value = "";
                controller.username.value.text = "";

                controller.levelOneIsDone.value = false;
                controller.levelTwoIsDone.value = false;
                controller.levelThreeIsDone.value = false;
                controller.levelFourIsDone.value = false;
                controller.levelFiveIsDone.value = false;
                controller.levelSixIsDone.value = false;
                controller.levelSevenIsDone.value = false;
                controller.levelEightIsDone.value = false;
                controller.levelNineIsDone.value = false;
                controller.levelTenIsDone.value = false;

                controller.scorePreTest.value = 0;
                controller.lifePoint.value = 5;
                controller.currentLevel.value = 1;
                controller.totalTimePreTest.value = 0;

                Get.offAllNamed("/home");
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
      child: Scaffold(
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
                  child: Text(
                      "Tindakan ini akan menghapus seluruh progress Anda. Apakah Anda yakin?"),
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
                      controller.character.value = "";
                      controller.currentUsername.value = "";
                      controller.username.value.text = "";

                      controller.levelOneIsDone.value = false;
                      controller.levelTwoIsDone.value = false;
                      controller.levelThreeIsDone.value = false;
                      controller.levelFourIsDone.value = false;
                      controller.levelFiveIsDone.value = false;
                      controller.levelSixIsDone.value = false;
                      controller.levelSevenIsDone.value = false;
                      controller.levelEightIsDone.value = false;
                      controller.levelNineIsDone.value = false;
                      controller.levelTenIsDone.value = false;

                      controller.scorePreTest.value = 0;
                      controller.lifePoint.value = 5;
                      controller.currentLevel.value = 1;
                      controller.totalTimePreTest.value = 0;

                      Get.offAllNamed("/home");
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
        body: Obx(() {
          List<Widget> materiSection = [
            MateriSKI(isMateriVisible: true.obs),
            MateriDoa(isMateriVisible: true.obs),
            MateriAdab(
              isMateriVisible: true.obs,
            ),
            MateriHikmah(isMateriVisible: true.obs)
          ];

          return Stack(
            children: [
              const BackgroundGame(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 4.w, left: 9.w),
                  width: 294.w,
                  height: 45.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/map.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                bottom: 15.w,
                left: 1.w,
                child: controller.levelOneIsDone.value == true &&
                        controller.levelOneIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelOneIsDone.value == true &&
                            controller.levelOneIsCorrect.value == false
                        ? const MapDoneFalse()
                        : MapActive(level: 1),
              ),
              Positioned(
                bottom: 25.w,
                left: 43.w,
                child: controller.levelTwoIsDone.value == true &&
                        controller.levelTwoIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelTwoIsDone.value == true &&
                            controller.levelTwoIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelOneIsDone.value == false
                            ? const MapInactive()
                            : controller.levelOneIsDone.value == true
                                ? MapActive(level: 2)
                                : Container(),
              ),
              Positioned(
                bottom: 3.w,
                left: 65.w,
                child: controller.levelThreeIsDone.value == true &&
                        controller.levelThreeIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelThreeIsDone.value == true &&
                            controller.levelThreeIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelTwoIsDone.value == false
                            ? const MapInactive()
                            : controller.levelTwoIsDone.value == true
                                ? MapActive(level: 3)
                                : Container(),
              ),
              Positioned(
                bottom: 13.w,
                left: 100.w,
                child: controller.levelFourIsDone.value == true &&
                        controller.levelFourIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelFourIsDone.value == true &&
                            controller.levelFourIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelThreeIsDone.value == false
                            ? const MapInactive()
                            : controller.levelThreeIsDone.value == true
                                ? MapActive(level: 4)
                                : Container(),
              ),
              Positioned(
                bottom: 42.w,
                left: 110.w,
                child: controller.levelFiveIsDone.value == true &&
                        controller.levelFiveIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelFiveIsDone.value == true &&
                            controller.levelFiveIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelFourIsDone.value == false
                            ? const MapInactive()
                            : controller.levelFourIsDone.value == true
                                ? MapActive(level: 5)
                                : Container(),
              ),
              Positioned(
                bottom: 28.w,
                left: 146.w,
                child: controller.levelSixIsDone.value == true &&
                        controller.levelSixIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelSixIsDone.value == true &&
                            controller.levelSixIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelFiveIsDone.value == false
                            ? const MapInactive()
                            : controller.levelFiveIsDone.value == true
                                ? MapActive(level: 6)
                                : Container(),
              ),
              Positioned(
                bottom: 12.w,
                left: 175.w,
                child: controller.levelSevenIsDone.value == true &&
                        controller.levelSevenIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelSevenIsDone.value == true &&
                            controller.levelSevenIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelSixIsDone.value == false
                            ? const MapInactive()
                            : controller.levelSixIsDone.value == true
                                ? MapActive(level: 7)
                                : Container(),
              ),
              Positioned(
                bottom: 33.w,
                left: 210.w,
                child: controller.levelEightIsDone.value == true &&
                        controller.levelEightIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelEightIsDone.value == true &&
                            controller.levelEightIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelSevenIsDone.value == false
                            ? const MapInactive()
                            : controller.levelSevenIsDone.value == true
                                ? MapActive(level: 8)
                                : Container(),
              ),
              Positioned(
                bottom: 22.w,
                left: 238.w,
                child: controller.levelNineIsDone.value == true &&
                        controller.levelNineIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelNineIsDone.value == true &&
                            controller.levelNineIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelEightIsDone.value == false
                            ? const MapInactive()
                            : controller.levelEightIsDone.value == true
                                ? MapActive(level: 9)
                                : Container(),
              ),
              Positioned(
                bottom: 20.w,
                left: 288.w,
                child: controller.levelTenIsDone.value == true &&
                        controller.levelTenIsCorrect.value == true
                    ? const MapDoneTrue()
                    : controller.levelTenIsDone.value == true &&
                            controller.levelTenIsCorrect.value == false
                        ? const MapDoneFalse()
                        : controller.levelNineIsDone.value == false
                            ? const MapInactive()
                            : controller.levelNineIsDone.value == true
                                ? MapActive(level: 10)
                                : Container(),
              ),
              controller.currentLevel.value != 1 &&
                      controller.currentLevel.value % 2 != 0 &&
                      controller.currentLevel.value <= 10
                  ? materiSection[Random().nextInt(materiSection.length)]
                  : const SizedBox(),
              GameEndedPreTest()
            ],
          );
        }),
      ),
    );
  }
}
