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
    GameplayArtiAyat(),
    GameplaySambungAyat(),
    GameplaySusunAyat(),
    GameplayTebakArtiSurah(),
    GameplayTebakSurah(),
  ];

  static Widget getRandomRoute() {
    return stagePages[Random().nextInt(stagePages.length)];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameplayController>(builder: (_) {
      return GetBuilder<AudioController>(builder: (audio) {
        return IconButton(
            onPressed: () {
              audio.pauseBackgroundSound();
              _.setIsCanPauseBackgroundAudio(true);
              Get.to(() => getRandomRoute());
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
