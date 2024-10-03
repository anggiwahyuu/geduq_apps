import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapActive extends StatelessWidget {
  MapActive({super.key, required this.level});

  final GameController controller = Get.put(GameController());

  final int level;

  static List<String> stagePages = [
    "/gameplay_sambung_ayat",
    "/gameplay_tebak_arti",
    "/gameplay_nama_surat_dari_ayat",
    "/gameplay_susun_ayat",
    "/gameplay_arti_ayat"
  ];

  static String getRandomRoute() {
    return stagePages[Random().nextInt(stagePages.length)];
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(getRandomRoute(), arguments: level);
      }, 
      icon: Column(
        children: [
          Container(
            width: 14.w,
            height: 33.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: controller.character.value == "Albab" 
                  ? const AssetImage("assets/images/albab_main.png") 
                  : const AssetImage("assets/images/ulil_main.png"),
                fit: BoxFit.fill
              )
            ),
          ),

          const Icon(
            Icons.location_on, 
            color: Colors.red,
            size: 40,
          ),
        ],
      )
    );
  }
}