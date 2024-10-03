import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/data/tutorial_storage.dart';
import 'package:geduq_apps/views/components/background_game_1.dart';
import 'package:geduq_apps/views/components/game_preparation.dart';
import 'package:geduq_apps/views/components/history_game.dart';
import 'package:geduq_apps/views/components/tutorial_gameplay.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget{
  HomeView({super.key});

  final isReady = false.obs;

  final isShowHistory = false.obs;

  final TutorialStorage tutorialStorage = Get.put(TutorialStorage());

  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundGame(),

          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo_apk.png"),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
            
                  Column(
                    children: [
                      Card(
                        color: const Color.fromARGB(255, 132, 36, 12),
                        elevation: 5,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 40,
                          child: InkWell(
                            onTap: () {
                              controller.pages.value = "/enter_house";
                              Get.toNamed("/enter_house", arguments: "home_view");
                            },
                            child: const Center(
                              child: Text("Materi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5,),

                      Card(
                        color: const Color.fromARGB(255, 132, 36, 12),
                        elevation: 5,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 40,
                          child: InkWell(
                            onTap: () {
                              if (isReady.isFalse) {
                                isReady.value = true;
                              } else {
                                isReady.value = false;
                              }
                            },
                            child: const Center(
                              child: Text("Permainan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5,),

                      Card(
                        color: const Color.fromARGB(255, 132, 36, 12),
                        elevation: 5,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 40,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/about");
                            },
                            child: const Center(
                              child: Text("Tentang", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5,),

                      Card(
                        color: const Color.fromARGB(255, 132, 36, 12),
                        elevation: 5,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 40,
                          child: InkWell(
                            onTap: () {
                              if (isShowHistory.isFalse) {
                                isShowHistory.value = true;
                              } else {
                                isShowHistory.value = false;
                              }
                            },
                            child: const Center(
                              child: Text("Riwayat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            right: 107.w,
            bottom: 114.h,
            child: IconButton(
              onPressed: () {
                tutorialStorage.isVisible.value = true;
                tutorialStorage.box.write("isVisible", true);
              },
              icon: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                    width: 2
                  )
                ),
                child: const Icon(
                  Icons.question_mark,
                  color: Colors.black,
                ),
              )
            ),
          ),
          
          HistoryGame(isVisible: isShowHistory),

          GamePreparation(isVisible: isReady),

          TutorialGameplay()
        ],
      ),
    );
  }
}

