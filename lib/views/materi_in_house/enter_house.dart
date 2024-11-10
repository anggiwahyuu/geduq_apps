import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/controllers/audio_controllers.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/views/components/background_game_2.dart';
import 'package:get/get.dart';

class EnterHouse extends StatelessWidget {
  EnterHouse({super.key});

  final GameController controller = Get.put(GameController());

  final audioController = Get.find<AudioController>();

  static List<String> materiPage = [
    "/materi_house_1",
    "/materi_house_2",
    "/materi_house_3",
    "/materi_house_4",
    "/materi_house_5",
    "/materi_house_6",
    "/materi_house_7",
    "/materi_house_8",
    "/materi_house_9",
    "/materi_house_10",
    "/materi_house_11"
  ];

  @override
  Widget build(BuildContext context) {
    audioController.backgroundPlayer.pause();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        controller.pages.value = "";
        Get.back();

        Future.delayed(const Duration(seconds: 1), () {
          audioController.playBackgroundSound(0.5);
        });
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              controller.pages.value = "";
              Get.back();

              Future.delayed(const Duration(seconds: 1), () {
                audioController.playBackgroundSound(0.5);
              });
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
            const BackgroundGameTwo(),
            Positioned(
                right: 0.w,
                top: 70.h,
                child: SizedBox(
                  width: 250.w,
                  height: 180.h,
                  child: SingleChildScrollView(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5.0.w,
                      runSpacing: 5.0.w,
                      children: List.generate(materiPage.length, (index) {
                        return Obx(() {
                          List<bool> isOpened = [
                            controller.materiOneIsOpen.value,
                            controller.materiTwoIsOpen.value,
                            controller.materiThreeIsOpen.value,
                            controller.materiFourIsOpen.value,
                            controller.materiFiveIsOpen.value,
                            controller.materiSixIsOpen.value,
                            controller.materiSevenIsOpen.value,
                            controller.materiEightIsOpen.value,
                            controller.materiNineIsOpen.value,
                            controller.materiTenIsOpen.value,
                            controller.materiElevenIsOpen.value
                          ];

                          return InkWell(
                            child: Container(
                              width: 50.w,
                              height: 35.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: isOpened[index] == false
                                          ? const AssetImage(
                                              "assets/images/materi_close.png")
                                          : const AssetImage(
                                              "assets/images/materi_opened.png"),
                                      fit: BoxFit.fill)),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.toNamed(materiPage[index]);
                            },
                          );
                        });
                      }),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
