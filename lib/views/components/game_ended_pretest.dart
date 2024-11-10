import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/controllers/audio_controllers.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/database/user_controller.dart';
import 'package:geduq_apps/views/components/history_game.dart';
import 'package:get/get.dart';

class GameEndedPreTest extends StatelessWidget {
  GameEndedPreTest({super.key});

  final GameController controller = Get.put(GameController());

  final UserController userController = Get.put(UserController());

  final audioController = Get.find<AudioController>();

  final isHistoryShown = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.levelTenIsDone.value == true) {
        return Stack(
          children: [
            Container(
              width: 1.sw,
              height: 1.sh,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(95, 0, 0, 0)),
              child: Center(
                child: Container(
                  width: 1.sw * 0.5,
                  height: 1.sh,
                  padding: EdgeInsets.only(
                      left: 30.w, right: 30.w, top: 40.w, bottom: 10.w),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/background_victory.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 25.w,
                            height: 25.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: controller.character.value == "Albab"
                                        ? const AssetImage(
                                            "assets/images/albab_main.png")
                                        : const AssetImage(
                                            "assets/images/ulil_main.png"),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            children: [
                              Text(
                                controller.username.value.text,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 50.w,
                                height: 1,
                                color: Colors.black,
                                margin: EdgeInsets.only(top: 2.w),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 25.w,
                            height: 25.w,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 18.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "SCORE",
                              style: TextStyle(fontSize: 8.sp),
                            ),
                            Text("${controller.scorePreTest.value} / 100",
                                style: TextStyle(fontSize: 8.sp))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: SizedBox(
                          width: 100.w,
                          height: 30.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      isHistoryShown.value = true;
                                    },
                                    icon: Icon(
                                      Icons.note,
                                      size: 22.w,
                                      color: Colors.black,
                                    )),
                              ),
                              VerticalDivider(
                                width: 4,
                                color: Colors.black,
                                thickness: 2,
                                indent: 3.w,
                                endIndent: 3.w,
                              ),
                              Expanded(
                                child: IconButton(
                                    onPressed: () async {
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
                                    icon: Icon(
                                      Icons.home,
                                      size: 22.w,
                                      color: Colors.black,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            HistoryGame(isVisible: isHistoryShown)
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
