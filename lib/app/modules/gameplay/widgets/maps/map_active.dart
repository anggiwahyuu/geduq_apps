import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geduq_apps/app/data/controller/audio_controllers.dart';
import 'package:geduq_apps/app/data/utils/image_helper.dart';
import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_controller.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/gameplay/gameplay_arti_ayat.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/gameplay/gameplay_sambung_ayat.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/gameplay/gameplay_susun_ayat.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/gameplay/gameplay_tebak_arti_surah.dart';
import 'package:geduq_apps/app/modules/gameplay/widgets/gameplay/gameplay_tebak_surah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapActive extends StatelessWidget {
  const MapActive({super.key});

  static List<Widget> stagePages = [
    GameplaySusunAyat(),
    GameplaySambungAyat(),
    GameplayTebakArtiSurah(),
    GameplayTebakSurah(),
  ];

  static List<Widget> stagePages2 = [
    GameplayArtiAyat(),
    GameplayTebakSurah(),
  ];

  static Widget getRandomRoute() {
    return stagePages2[Random().nextInt(stagePages2.length)];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameplayController>(builder: (_) {
      return GetBuilder<AudioController>(builder: (audio) {
        return IconButton(
            onPressed: () async {
              await Future.delayed(Duration.zero, () {
                _.setRandomPickSusunAyat();
                _.setRandomPickSambungAyat();
                _.setRandomPickTebakArti();
                _.setRandomPickArtiAyat();
                _.setRandomPickTebakSurah();
              });

              audio.pauseBackgroundSound();
              _.setIsCanPauseBackgroundAudio(true);

              if (_.currentLevel <= 3) {
                Get.to(() => stagePages[0]);
              } else if (_.currentLevel > 3 && _.currentLevel <= 6) {
                Get.to(() => stagePages[1]);
              } else if (_.currentLevel > 6 && _.currentLevel <= 8) {
                Get.to(() => stagePages[2]);
              } else {
                Get.to(() => stagePages[3]);
                // Get.to(() => getRandomRoute());
              }
            },
            icon: Column(
              children: [
                Container(
                  width: 14.w,
                  height: 14.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _.character == "Albab"
                          ? const AssetImage(ImageHelper.imgAlbabMainPng)
                          : const AssetImage(ImageHelper.imgUlilMainPng),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 18.w,
                ),
              ],
            ));
      });
    });
  }
}
