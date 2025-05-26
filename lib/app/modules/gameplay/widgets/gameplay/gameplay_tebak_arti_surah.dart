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

                                Get.offNamed(Routes.HOME);

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

                                        main.addStageTebakArtiDone(main.randomPickTebakArti);

                                        main.setAddCurrentLevel();

                                        main.setIsCanPauseBackgroundAudio(false);

                                        audio.playBackgroundSound(0.5);

                                        Get.back();
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
  }
}
