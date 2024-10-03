import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/audio_controllers.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/controllers/gameplay_susun_ayat_controller.dart';
import 'package:geduq_apps/controllers/timer_controller.dart';
import 'package:geduq_apps/database/user_controller.dart';
import 'package:geduq_apps/database/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameplaySusunAyat extends StatelessWidget {
  GameplaySusunAyat({super.key});

  final answer = [].obs;

  final expressionCharaImg = "".obs;

  final isAnswer = false.obs;

  final correctAnswer = 0.obs;

  final isCorrect = false.obs;

  final GameController controller = Get.put(GameController());

  final TimerController timerController = Get.put(TimerController());

  final SusunAyatController susunAyatController = Get.put(SusunAyatController());

  final UserController userController = Get.put(UserController());

  final audioController = Get.find<AudioController>();

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
            decoration: const BoxDecoration(
              color: Color.fromARGB(95, 0, 0, 0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(expressionCharaImg.value)
                    )
                  ),
                ),
          
                Card(
                  elevation: 5,
                  color: Colors.red,
                  child: InkWell(
                    child: const SizedBox(
                      width: 200,
                      height: 50,
                      child: Center(
                        child: Text("Kembali", style: TextStyle(color: Colors.white),),
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
                  )
                )
              ]
            )
          );
        } else {
          return SizedBox(
            child: Stack(
              children: [ 
                Container(
                  padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 20.w),
                  child: Column(
                    children: [
                      Container(
                        width: 40.w,
                        height: 100.h,
                        margin: EdgeInsets.only(bottom: 5.h),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo_apk.png"),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Susun ayat yuk!", style: TextStyle(fontSize: 7.sp),),
                      ),
                            
                      Align(
                        alignment: Alignment.topRight,
                        child: susunAyatController.items.isNotEmpty
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
                                      await audioController.playSound(susunAyatController.items[susunAyatController.randomPick]["sound"]);
                                    }, 
                                    icon: Icon(
                                      Icons.volume_up,
                                      size: 18.dm,
                                    )
                                  ),
                                ),
                              ]
                            ),
                            
                            SizedBox(height: 7.h,),
                            
                            Wrap(
                              spacing: 3.0.w,
                              runSpacing: 4.0.h,
                              children: List.generate(susunAyatController.option.length, (index) {
                                
                                return Card(
                                  elevation: 5,
                                  child: InkWell(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 8.0.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          susunAyatController.option[index],
                                          style: TextStyle(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        if (answer.length < 3) {
                                          answer.insert(0, susunAyatController.option[index]);
                                          susunAyatController.option.removeAt(index);
                                        }
                                      },
                                    ),
                                  );
                                },
                              )
                            ),
          
                            answer.isEmpty
                            ? Container()
                            : Align(
                              alignment: Alignment.topLeft,
                              child: Wrap(
                                spacing: 3.0.w,
                                runSpacing: 4.0.h,
                                children: List.generate(answer.length, (index) {
                                  
                                  return Card(
                                    elevation: 5,
                                    child: InkWell(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 8.0.w),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            answer[index],
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          susunAyatController.option.add(answer[index]);
                                          answer.removeAt(index);
                                        },
                                      ),
                                    );
                                  },
                                )
                              ),
                            ),
          
                            answer.length < 3
                            ? Container()
                            : Align(
                              alignment: Alignment.bottomRight,
                              child: Card(
                                elevation: 5,
                                color: Colors.green,
                                child: InkWell(
                                  child: SizedBox(
                                    width: 60.w,
                                    height: 45.h,
                                    child: const Center(
                                      child: Text("Selesai", style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                  onTap: () async {
                                    for (int i = 0; i < answer.length; i++) {
                                      if (answer[i] == susunAyatController.items[susunAyatController.randomPick]["correct_answer"][i]) {
                                        correctAnswer.value++;
                                      } else {
                                        correctAnswer.value--;
                                      }
                                    }
          
                                    if(correctAnswer.value == 3) {
                                      await audioController.playSound("sounds/sound_true.mp3");
          
                                      if (controller.character.value == "Albab") {
                                        expressionCharaImg.value = "assets/images/albab_senang.png";
                                      } else if (controller.character.value == "Ulil") {
                                        expressionCharaImg.value = "assets/images/ulil_senang.png";
                                      }
                              
                                      isCorrect.value = true;
                                      controller.scorePreTest.value += 10;
                                    } else {
                                      await audioController.playSound("sounds/sound_false.mp3");
          
                                      if (controller.character.value == "Albab") {
                                        expressionCharaImg.value = "assets/images/albab_sedih.png";
                                      } else if (controller.character.value == "Ulil") {
                                        expressionCharaImg.value = "assets/images/ulil_sedih.png";
                                      }
                              
                                      isCorrect.value = false;
                                      controller.lifePoint.value--;
                                      controller.scorePreTest.value += 0;
                                    }
                                          
                                    controller.totalTimePreTest.value = timerController.remainingTimes.value;
                                    timerController.timer!.cancel();
                                    isAnswer.value = true;
                                  },
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
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Positioned(
                  top: 10.w,
                  left: 10.w,
                  child: Wrap(
                    spacing: 1.0,
                    runSpacing: 1.0,
                    children: List.generate(controller.lifePoint.value, (index) {
                      return const Icon(
                        Icons.favorite, 
                        color: Colors.red,
                        size: 40,
                      );
                    }),
                  )
                ),
          
                Visibility(
                  visible: isAnswer.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(95, 0, 0, 0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(expressionCharaImg.value)
                            )
                          ),
                        ),
          
                        Card(
                          elevation: 5,
                          color: Colors.green,
                          child: InkWell(
                            child: const SizedBox(
                              width: 200,
                              height: 50,
                              child: Center(
                                child: Text("Level Selanjutnya", style: TextStyle(color: Colors.white),),
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
                                  controller.levelThreeIsCorrect.value = false;
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
                                  controller.levelSevenIsCorrect.value = false;
                                }
                              } else if (level == 8) {
                                controller.levelEightIsDone.value = true;
                                if (isCorrect.value == true) {
                                  controller.levelEightIsCorrect.value = true;
                                } else {
                                  controller.levelEightIsCorrect.value = false;
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

                                await userController.createUser(
                                  User(
                                    username: controller.currentUsername.value,
                                    selectCharacter: controller.character.value, 
                                    scorePreTest: controller.scorePreTest.value,
                                    timesPreTest: controller.totalTimePreTest.value,
                                    isPreTestDone: "true"
                                  )
                                );
                              }
          
                              controller.stageSusunAyatDone.add(susunAyatController.randomPick);
          
                              audioController.playBackgroundSound(0.5);

                              controller.currentLevel.value = level + 1;
          
                              Get.back();
                            },
                          )
                        )
                      ]
                    ),
                  ),
                )
              ]
            ),
          );
        }
      }),
    );
  }
}