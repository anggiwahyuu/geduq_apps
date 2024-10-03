import 'package:flutter/material.dart';
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(95, 0, 0, 0)
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(left: 80, right: 80, top: 90, bottom: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background_victory.png"),
                      fit: BoxFit.fill
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: controller.character.value == "Albab" 
                                  ? const AssetImage("assets/images/albab_main.png") 
                                  : const AssetImage("assets/images/ulil_main.png"),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                controller.username.value.text,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
            
                              Container(
                                width: 120,
                                height: 1,
                                color: Colors.black,
                                margin: const EdgeInsets.only(top: 4),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            height: 60,
                          )
                        ],
                      ),
            
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            const Text("SCORE", style: TextStyle(fontSize: 17),),
                            Text("${controller.scorePreTest.value} / 100", style: const TextStyle(fontSize: 17))
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
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: SizedBox(
                          width: 200,
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {            
                                    isHistoryShown.value = true;
                                  }, 
                                  icon: const Icon(
                                    Icons.history,
                                    size: 50,
                                    color: Colors.black,
                                  )
                                ),
                              ),

                              const VerticalDivider(
                                width: 4,
                                color: Colors.black,
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
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
                                  icon: const Icon(
                                    Icons.home, 
                                    size: 50, 
                                    color: Colors.black,
                                  )
                                ),
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