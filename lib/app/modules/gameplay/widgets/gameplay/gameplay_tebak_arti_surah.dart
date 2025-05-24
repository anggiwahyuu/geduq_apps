// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/app/data/controller/audio_controllers.dart';
import 'package:geduq_apps/app/data/utils/image_helper.dart';
import 'package:geduq_apps/app/data/utils/sound_helper.dart';
import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_controller.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:geduq_apps/app/routes/app_pages.dart';
import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_tebak_arti_controller.dart';
import 'package:geduq_apps/app/data/controller/timer_controller.dart';
import 'package:geduq_apps/app/data/sqlite/user_controller.dart';
import 'package:geduq_apps/app/data/sqlite/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameplayTebakArtiSurah extends StatelessWidget {
  const GameplayTebakArtiSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TebakArtiController>(
      init: TebakArtiController(),
      builder: (_) {
        return GetBuilder<TimerController>(
          init: TimerController(),
          builder: (timer) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: GetBuilder<AudioController>(builder: (audio) {
                return GetBuilder<GameplayController>(builder: (main) {
                  if (main.lifePoint <= 0) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(color: Color.fromARGB(95, 0, 0, 0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(_.expressionCharaImg))),
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
                                main.resetAll();

                                final homeCtrl = Get.find<HomeController>();
                                homeCtrl.resetAll();

                                Get.offAllNamed(Routes.HOME);

                                Future.delayed(const Duration(seconds: 1), () {
                                  audio.playBackgroundSound(0.5);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5.w, left: 10.w, right: 20.w),
                            child: Column(
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  margin: EdgeInsets.only(bottom: 5.w),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(image: AssetImage(ImageHelper.imgLogoApkPng), fit: BoxFit.cover),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Pilihlah jawaban yang tepat!",
                                    style: TextStyle(fontSize: 7.sp),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: main.itemsTebakArti.isNotEmpty
                                      ? Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 7.w,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                main.itemsTebakArti[main.randomPickTebakArti]["image"] == null
                                                    ? SizedBox()
                                                    : Container(
                                                        width: 40.w,
                                                        height: 40.w,
                                                        margin: EdgeInsets.only(right: 5.w),
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: AssetImage(
                                                                main.itemsTebakArti[main.randomPickTebakArti]["image"]),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                Expanded(
                                                  child: SizedBox(
                                                    child: Text(
                                                      main.itemsTebakArti[main.randomPickTebakArti]["question"],
                                                      style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                                                      textAlign: TextAlign.justify,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4.w,
                                            ),
                                            Wrap(
                                              spacing: 3.0.w,
                                              runSpacing: 2.0.w,
                                              children: List.generate(
                                                main.optionTebakArti.length,
                                                (index) {
                                                  return Card(
                                                    elevation: 5,
                                                    child: InkWell(
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(vertical: 4.0.w, horizontal: 9.0.w),
                                                        decoration: BoxDecoration(
                                                          color: _.selectedIndex == index ? Colors.green : Colors.white,
                                                          borderRadius: BorderRadius.circular(10),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Colors.black12,
                                                              blurRadius: 4,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Text(
                                                          main.optionTebakArti[index],
                                                          style: TextStyle(
                                                            fontSize: 6.5.sp,
                                                            fontWeight: FontWeight.bold,
                                                            color: _.selectedIndex == index ? Colors.white : Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        _.setSelectedIndex(index);
                                                        _.setAnswer(main.optionTebakArti[index]);
                                                        _.setIsChoose(true);
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3.w,
                                            ),
                                            Visibility(
                                              visible: _.isChoose,
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
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      if (_.answer ==
                                                          main.itemsTebakArti[main.randomPickTebakArti]["correct_answer"]) {
                                                        await audio.playSound(SoundHelper.soundTrueMp3);

                                                        if (main.character == "Albab") {
                                                          _.setExpressionCharaImg(ImageHelper.imgAlbabSenangPng);
                                                        } else if (main.character == "Ulil") {
                                                          _.setExpressionCharaImg(ImageHelper.imgUlilSenangPng);
                                                        }

                                                        _.setIsCorrect(true);
                                                        main.addOrReduceScore(isAdd: true, value: 10);
                                                      } else {
                                                        await audio.playSound(SoundHelper.soundFalseMp3);

                                                        if (main.character == "Albab") {
                                                          _.setExpressionCharaImg(ImageHelper.imgAlbabSedihPng);
                                                        } else if (main.character == "Ulil") {
                                                          _.setExpressionCharaImg(ImageHelper.imgUlilSedihPng);
                                                        }

                                                        _.setIsCorrect(false);
                                                        main.addOrReduceLifePoint(isAdd: false);
                                                      }

                                                      main.setTimer(timer.remainingTimes);
                                                      timer.stopTimer();
                                                      _.setIsAnswer(true);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : CircularProgressIndicator(),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 15.w,
                            right: 15.w,
                            child: Text(
                              "${timer.remainingTimes}",
                              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            top: 10.w,
                            left: 10.w,
                            child: Wrap(
                              spacing: 1.0,
                              runSpacing: 1.0,
                              children: List.generate(main.lifePoint, (index) {
                                return const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 40,
                                );
                              }),
                            ),
                          ),
                          Visibility(
                            visible: _.isAnswer,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(color: Color.fromARGB(95, 0, 0, 0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 2.5,
                                    decoration:
                                        BoxDecoration(image: DecorationImage(image: AssetImage(_.expressionCharaImg))),
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
                                        main.setLevelDone(main.currentLevel);
                                        if (_.isCorrect == true) {
                                          main.setLevelCorrect(main.currentLevel);
                                        }

                                        if (main.currentLevel == 10) {
                                          final userController = Get.find<UserController>();

                                          await userController.createUser(
                                            User(
                                              username: main.currentUsername,
                                              selectCharacter: main.character,
                                              scorePreTest: main.score,
                                              timesPreTest: main.totalTimePreTest,
                                              isPreTestDone: "true",
                                            ),
                                          );
                                        }

                                        audio.playBackgroundSound(0.5);

                                        main.addStageTebakArtiDone(main.randomPickTebakArti);

                                        main.setAddCurrentLevel();

                                        Get.back();

                                        Future.delayed(Duration(milliseconds: 200)).then((value) {
                                          main.setRandomPickTebakArti();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                });
              }),
            );
          },
        );
      },
    );
    // audioController.backgroundPlayer.pause();
    // timerController.remainingTimes = controller.totalTimePreTest;

    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   body: Obx(() {
    //     audioController.backgroundPlayer.pause();

    //     if (controller.lifePoint <= 0) {
    //       return Container();
    //     } else {
    //       return SizedBox(
    //         child: Stack(children: [
    //           Container(
    //             padding: EdgeInsets.only(top: 5.w, left: 10.w, right: 20.w),
    //             child: Column(
    //               children: [
    //                 Container(
    //                   width: 40.w,
    //                   height: 40.w,
    //                   margin: EdgeInsets.only(bottom: 5.w),
    //                   decoration: const BoxDecoration(
    //                     image: DecorationImage(image: AssetImage("assets/images/logo_apk.png"), fit: BoxFit.cover),
    //                   ),
    //                 ),
    //                 Align(
    //                   alignment: Alignment.topLeft,
    //                   child: Text(
    //                     "Pilihlah jawaban yang tepat!",
    //                     style: TextStyle(fontSize: 7.sp),
    //                   ),
    //                 ),
    //                 Align(
    //                   alignment: Alignment.topLeft,
    //                   child: tebakArtiController.items.isNotEmpty
    //                       ? Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             SizedBox(
    //                               height: 7.w,
    //                             ),
    //                             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    //                               tebakArtiController.items[tebakArtiController.randomPick]["image"] == null
    //                                   ? Container()
    //                                   : Container(
    //                                       width: 40.w,
    //                                       height: 40.w,
    //                                       margin: EdgeInsets.only(right: 5.w),
    //                                       decoration: BoxDecoration(
    //                                           image: DecorationImage(
    //                                               image: AssetImage(
    //                                                   tebakArtiController.items[tebakArtiController.randomPick]["image"]),
    //                                               fit: BoxFit.fill)),
    //                                     ),
    //                               Expanded(
    //                                 child: SizedBox(
    //                                   child: Text(
    //                                     tebakArtiController.items[tebakArtiController.randomPick]["question"],
    //                                     style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
    //                                     textAlign: TextAlign.justify,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ]),
    //                             SizedBox(
    //                               height: 4.w,
    //                             ),
    //                             Wrap(
    //                                 spacing: 3.0.w,
    //                                 runSpacing: 2.0.w,
    //                                 children: List.generate(
    //                                   tebakArtiController.option.length,
    //                                   (index) {
    //                                     return Card(
    //                                       elevation: 5,
    //                                       child: InkWell(
    //                                         child: Container(
    //                                           padding: EdgeInsets.symmetric(vertical: 4.0.w, horizontal: 9.0.w),
    //                                           decoration: BoxDecoration(
    //                                             color: selectedIndex.value == index ? Colors.green : Colors.white,
    //                                             borderRadius: BorderRadius.circular(10),
    //                                             boxShadow: const [
    //                                               BoxShadow(
    //                                                 color: Colors.black12,
    //                                                 blurRadius: 4,
    //                                               ),
    //                                             ],
    //                                           ),
    //                                           child: Text(
    //                                             tebakArtiController.option[index],
    //                                             style: TextStyle(
    //                                               fontSize: 6.5.sp,
    //                                               fontWeight: FontWeight.bold,
    //                                               color: selectedIndex.value == index ? Colors.white : Colors.black,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                         onTap: () {
    //                                           selectedIndex.value = index;
    //                                           answer.value = tebakArtiController.option[index];
    //                                           isChoose.value = true;
    //                                         },
    //                                       ),
    //                                     );
    //                                   },
    //                                 )),
    //                             SizedBox(
    //                               height: 3.w,
    //                             ),
    //                             Visibility(
    //                               visible: isChoose.value,
    //                               child: Align(
    //                                 alignment: Alignment.bottomRight,
    //                                 child: Card(
    //                                   elevation: 5,
    //                                   color: Colors.green,
    //                                   child: InkWell(
    //                                     child: SizedBox(
    //                                       width: 60.w,
    //                                       height: 20.w,
    //                                       child: const Center(
    //                                         child: Text(
    //                                           "Selesai",
    //                                           style: TextStyle(color: Colors.white),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                     onTap: () async {
    //                                       if (answer ==
    //                                           tebakArtiController.items[tebakArtiController.randomPick]["correct_answer"]) {
    //                                         await audioController.playSound("sounds/sound_true.mp3");

    //                                         if (controller.character == "Albab") {
    //                                           expressionCharaImg.value = "assets/images/albab_senang.png";
    //                                         } else if (controller.character == "Ulil") {
    //                                           expressionCharaImg.value = "assets/images/ulil_senang.png";
    //                                         }

    //                                         isCorrect.value = true;
    //                                         controller.scorePreTest += 10;
    //                                       } else {
    //                                         await audioController.playSound("sounds/sound_false.mp3");

    //                                         if (controller.character == "Albab") {
    //                                           expressionCharaImg.value = "assets/images/albab_sedih.png";
    //                                         } else if (controller.character == "Ulil") {
    //                                           expressionCharaImg.value = "assets/images/ulil_sedih.png";
    //                                         }

    //                                         isCorrect.value = false;
    //                                         controller.lifePoint--;
    //                                         controller.scorePreTest += 0;
    //                                       }

    //                                       controller.totalTimePreTest = timerController.remainingTimes;
    //                                       timerController.timer!.cancel();
    //                                       isAnswer.value = true;
    //                                     },
    //                                   ),
    //                                 ),
    //                               ),
    //                             )
    //                           ],
    //                         )
    //                       : const CircularProgressIndicator(),
    //                 )
    //               ],
    //             ),
    //           ),
    //           Positioned(
    //             top: 15.w,
    //             right: 15.w,
    //             child: Text(
    //               "${timerController.remainingTimes}",
    //               style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           Positioned(
    //               top: 10.w,
    //               left: 10.w,
    //               child: Wrap(
    //                 spacing: 1.0,
    //                 runSpacing: 1.0,
    //                 children: List.generate(controller.lifePoint, (index) {
    //                   return const Icon(
    //                     Icons.favorite,
    //                     color: Colors.red,
    //                     size: 40,
    //                   );
    //                 }),
    //               )),
    //           Visibility(
    //             visible: isAnswer.value,
    //             child: Container(
    //               width: MediaQuery.of(context).size.width,
    //               height: MediaQuery.of(context).size.height,
    //               decoration: const BoxDecoration(color: Color.fromARGB(95, 0, 0, 0)),
    //               child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    //                 Container(
    //                   width: MediaQuery.of(context).size.width / 2.5,
    //                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage(expressionCharaImg.value))),
    //                 ),
    //                 Card(
    //                     elevation: 5,
    //                     color: Colors.green,
    //                     child: InkWell(
    //                       child: const SizedBox(
    //                         width: 200,
    //                         height: 50,
    //                         child: Center(
    //                           child: Text(
    //                             "Level Selanjutnya",
    //                             style: TextStyle(color: Colors.white),
    //                           ),
    //                         ),
    //                       ),
    //                       onTap: () async {
    //                         if (level == 1) {
    //                           controller.levelOneIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelOneIsCorrect = true;
    //                           } else {
    //                             controller.levelOneIsCorrect = false;
    //                           }
    //                         } else if (level == 2) {
    //                           controller.levelTwoIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelTwoIsCorrect = true;
    //                           } else {
    //                             controller.levelTwoIsCorrect = false;
    //                           }
    //                         } else if (level == 3) {
    //                           controller.levelThreeIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelThreeIsCorrect = true;
    //                           } else {
    //                             controller.levelThreeIsCorrect = false;
    //                           }
    //                         } else if (level == 4) {
    //                           controller.levelFourIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelFourIsCorrect = true;
    //                           } else {
    //                             controller.levelFourIsCorrect = false;
    //                           }
    //                         } else if (level == 5) {
    //                           controller.levelFiveIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelFiveIsCorrect = true;
    //                           } else {
    //                             controller.levelFiveIsCorrect = false;
    //                           }
    //                         } else if (level == 6) {
    //                           controller.levelSixIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelSixIsCorrect = true;
    //                           } else {
    //                             controller.levelSixIsCorrect = false;
    //                           }
    //                         } else if (level == 7) {
    //                           controller.levelSevenIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelSevenIsCorrect = true;
    //                           } else {
    //                             controller.levelSevenIsCorrect = false;
    //                           }
    //                         } else if (level == 8) {
    //                           controller.levelEightIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelEightIsCorrect = true;
    //                           } else {
    //                             controller.levelEightIsCorrect = false;
    //                           }
    //                         } else if (level == 9) {
    //                           controller.levelNineIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelNineIsCorrect = true;
    //                           } else {
    //                             controller.levelNineIsCorrect = false;
    //                           }
    //                         } else if (level == 10) {
    //                           controller.levelTenIsDone = true;
    //                           if (isCorrect.value == true) {
    //                             controller.levelTenIsCorrect = true;
    //                           } else {
    //                             controller.levelTenIsCorrect = false;
    //                           }

    //                           await userController.createUser(User(
    //                               username: controller.currentUsername,
    //                               selectCharacter: controller.character,
    //                               scorePreTest: controller.scorePreTest,
    //                               timesPreTest: controller.totalTimePreTest,
    //                               isPreTestDone: "true"));
    //                         }

    //                         controller.stageTebakArtiDone.add(tebakArtiController.randomPick);

    //                         audioController.playBackgroundSound(0.5);

    //                         controller.currentLevel = level + 1;

    //                         Get.back();
    //                       },
    //                     ))
    //               ]),
    //             ),
    //           )
    //         ]),
    //       );
    //     }
    //   }),
    // );
  }
}
