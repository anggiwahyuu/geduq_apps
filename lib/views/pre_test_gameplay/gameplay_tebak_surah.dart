// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/audio_controllers.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/controllers/gameplay_tebak_surah_controller.dart';
import 'package:geduq_apps/controllers/timer_controller.dart';
import 'package:geduq_apps/database/user_controller.dart';
import 'package:geduq_apps/database/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameplayTebakSurah extends StatelessWidget {
  GameplayTebakSurah({super.key});

  final answer = "".obs;

  final selectedIndex = (-1).obs;

  final isChoose = false.obs;

  final expressionCharaImg = "".obs;

  final isAnswer = false.obs;

  final isCorrect = false.obs;

  final GameController controller = Get.put(GameController());

  final audioController = Get.find<AudioController>();

  final TimerController timerController = Get.put(TimerController());

  final TebakSurahController tebakSurahController =
      Get.put(TebakSurahController());

  final UserController userController = Get.put(UserController());

  final int level = Get.arguments as int;

  @override
  Widget build(BuildContext context) {
    audioController.backgroundPlayer.pause();
    timerController.remainingTimes.value = controller.totalTimePreTest.value;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(() {
        audioController.backgroundPlayer.pause();

        if (controller.lifePoint.value <= 0) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(95, 0, 0, 0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(expressionCharaImg.value))),
                    ),
                    Card(
                        elevation: 5,
                        color: Colors.red,
                        child: InkWell(
                          child: const SizedBox(
                            width: 200,
                            height: 50,
                            child: Center(
                              child: Text(
                                "Kembali",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {
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

                            Future.delayed(const Duration(seconds: 1), () {
                              audioController.playBackgroundSound(0.5);
                            });
                          },
                        ))
                  ]));
        } else {
          return SizedBox(
            child: Stack(children: [
              Container(
                padding: EdgeInsets.only(top: 5.w, left: 10.w, right: 20.w),
                child: Column(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.only(bottom: 5.w),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo_apk.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Apa nama surat dari potongan ayat di bawah ini?",
                        style: TextStyle(fontSize: 7.sp),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: tebakSurahController.items.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Transform.flip(
                                        flipX: true,
                                        child: IconButton(
                                            onPressed: () async {
                                              await audioController.playSound(
                                                  tebakSurahController.items[
                                                          tebakSurahController
                                                              .randomPick]
                                                      ["sound"]);
                                            },
                                            icon: Icon(
                                              Icons.volume_up,
                                              size: 18.dm,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            tebakSurahController.items[
                                                tebakSurahController
                                                    .randomPick]["question"],
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Wrap(
                                      spacing: 3.0.w,
                                      runSpacing: 2.0.w,
                                      children: List.generate(
                                        tebakSurahController.option.length,
                                        (index) {
                                          return Card(
                                            elevation: 5,
                                            child: InkWell(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0.w,
                                                    horizontal: 9.0.w),
                                                decoration: BoxDecoration(
                                                  color: selectedIndex.value ==
                                                          index
                                                      ? Colors.green
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 4,
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  tebakSurahController
                                                      .option[index],
                                                  style: TextStyle(
                                                    fontSize: 7.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        selectedIndex.value ==
                                                                index
                                                            ? Colors.white
                                                            : Colors.black,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                selectedIndex.value = index;
                                                answer.value =
                                                    tebakSurahController
                                                        .option[index];
                                                isChoose.value = true;
                                              },
                                            ),
                                          );
                                        },
                                      )),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Visibility(
                                  visible: isChoose.value,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Card(
                                      elevation: 5,
                                      color: Colors.green,
                                      child: InkWell(
                                        child: SizedBox(
                                          width: 60.w,
                                          height: 20.w,
                                          child: const Center(
                                            child: Text(
                                              "Selesai",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          if (answer ==
                                              tebakSurahController.items[
                                                      tebakSurahController
                                                          .randomPick]
                                                  ["correct_answer"]) {
                                            await audioController.playSound(
                                                "sounds/sound_true.mp3");

                                            if (controller.character.value ==
                                                "Albab") {
                                              expressionCharaImg.value =
                                                  "assets/images/albab_senang.png";
                                            } else if (controller
                                                    .character.value ==
                                                "Ulil") {
                                              expressionCharaImg.value =
                                                  "assets/images/ulil_senang.png";
                                            }

                                            isCorrect.value = true;
                                            controller.scorePreTest.value += 10;
                                          } else {
                                            await audioController.playSound(
                                                "sounds/sound_false.mp3");

                                            if (controller.character.value ==
                                                "Albab") {
                                              expressionCharaImg.value =
                                                  "assets/images/albab_sedih.png";
                                            } else if (controller
                                                    .character.value ==
                                                "Ulil") {
                                              expressionCharaImg.value =
                                                  "assets/images/ulil_sedih.png";
                                            }

                                            isCorrect.value = false;
                                            controller.lifePoint.value--;
                                            controller.scorePreTest.value += 0;
                                          }

                                          controller.totalTimePreTest.value =
                                              timerController
                                                  .remainingTimes.value;
                                          timerController.timer!.cancel();
                                          isAnswer.value = true;
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : const CircularProgressIndicator(),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 15.w,
                right: 15.w,
                child: Text(
                  "${timerController.remainingTimes.value}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  top: 10.w,
                  left: 10.w,
                  child: Wrap(
                    spacing: 1.0,
                    runSpacing: 1.0,
                    children:
                        List.generate(controller.lifePoint.value, (index) {
                      return const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 40,
                      );
                    }),
                  )),
              Visibility(
                visible: isAnswer.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration:
                      const BoxDecoration(color: Color.fromARGB(95, 0, 0, 0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(expressionCharaImg.value))),
                        ),
                        Card(
                            elevation: 5,
                            color: Colors.green,
                            child: InkWell(
                              child: const SizedBox(
                                width: 200,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Level Selanjutnya",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                if (level == 1) {
                                  controller.levelOneIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelOneIsCorrect.value = true;
                                  } else {
                                    controller.levelOneIsCorrect.value = false;
                                  }
                                } else if (level == 2) {
                                  controller.levelTwoIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelTwoIsCorrect.value = true;
                                  } else {
                                    controller.levelTwoIsCorrect.value = false;
                                  }
                                } else if (level == 3) {
                                  controller.levelThreeIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelThreeIsCorrect.value = true;
                                  } else {
                                    controller.levelThreeIsCorrect.value =
                                        false;
                                  }
                                } else if (level == 4) {
                                  controller.levelFourIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelFourIsCorrect.value = true;
                                  } else {
                                    controller.levelFourIsCorrect.value = false;
                                  }
                                } else if (level == 5) {
                                  controller.levelFiveIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelFiveIsCorrect.value = true;
                                  } else {
                                    controller.levelFiveIsCorrect.value = false;
                                  }
                                } else if (level == 6) {
                                  controller.levelSixIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelSixIsCorrect.value = true;
                                  } else {
                                    controller.levelSixIsCorrect.value = false;
                                  }
                                } else if (level == 7) {
                                  controller.levelSevenIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelSevenIsCorrect.value = true;
                                  } else {
                                    controller.levelSevenIsCorrect.value =
                                        false;
                                  }
                                } else if (level == 8) {
                                  controller.levelEightIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelEightIsCorrect.value = true;
                                  } else {
                                    controller.levelEightIsCorrect.value =
                                        false;
                                  }
                                } else if (level == 9) {
                                  controller.levelNineIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelNineIsCorrect.value = true;
                                  } else {
                                    controller.levelNineIsCorrect.value = false;
                                  }
                                } else if (level == 10) {
                                  controller.levelTenIsDone.value = true;
                                  if (isCorrect.value == true) {
                                    controller.levelTenIsCorrect.value = true;
                                  } else {
                                    controller.levelTenIsCorrect.value = false;
                                  }

                                  await userController.createUser(User(
                                      username:
                                          controller.currentUsername.value,
                                      selectCharacter:
                                          controller.character.value,
                                      scorePreTest:
                                          controller.scorePreTest.value,
                                      timesPreTest:
                                          controller.totalTimePreTest.value,
                                      isPreTestDone: "true"));
                                }

                                controller.stageTebakSurahDone
                                    .add(tebakSurahController.randomPick);

                                audioController.playBackgroundSound(0.5);

                                controller.currentLevel.value = level + 1;

                                Get.back();
                              },
                            ))
                      ]),
                ),
              )
            ]),
          );
        }
      }),
    );
  }
}
