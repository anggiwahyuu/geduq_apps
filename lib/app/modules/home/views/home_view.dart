import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/controller/tutorial_storage.dart';
import 'package:geduq_apps/app/globalwidgets/background_game_1.dart';
import 'package:geduq_apps/app/globalwidgets/globalslidefrombutton.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:geduq_apps/app/modules/home/widgets/game_preparation.dart';
import 'package:geduq_apps/app/modules/home/widgets/history_widget.dart';
import 'package:geduq_apps/app/modules/home/widgets/tutorial_gameplay.dart';
import 'package:geduq_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (state) {
          final tutorialStorage = Get.find<TutorialStorage>();

          if (tutorialStorage.isVisible) {
            GlobalSlideFromBottomDialog.show(context: context, child: TutorialGameplay());
          }
        },
        builder: (_) {
          return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                AlertDialog alert = AlertDialog(
                  title: const Text(
                    "Peringatan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: const SizedBox(
                    child: Text("Apakah Anda yakin ingin keluar dari permainan ini?"),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        "Batal",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FlutterExitApp.exitApp();
                      },
                      child: const Text(
                        "Ya",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                );

                showDialog(context: context, builder: (context) => alert);
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    const BackgroundGame(),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 45.w,
                              height: 45.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/logo_apk.png"), fit: BoxFit.cover),
                              ),
                            ),
                            Column(
                              children: [
                                Card(
                                  color: const Color.fromARGB(255, 132, 36, 12),
                                  elevation: 5,
                                  child: SizedBox(
                                    width: 1.sh * 0.55,
                                    height: 18.w,
                                    child: InkWell(
                                      onTap: () {
                                        // _.pages = "/enter_house";
                                        Get.toNamed(Routes.MATERI, arguments: "home_view");
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Materi",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Card(
                                  color: const Color.fromARGB(255, 132, 36, 12),
                                  elevation: 5,
                                  child: SizedBox(
                                    width: 1.sh * 0.55,
                                    height: 18.w,
                                    child: InkWell(
                                      onTap: () {
                                        GlobalSlideFromBottomDialog.show(context: context, child: GamePreparation());
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Permainan",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Card(
                                  color: const Color.fromARGB(255, 132, 36, 12),
                                  elevation: 5,
                                  child: SizedBox(
                                    width: 1.sh * 0.55,
                                    height: 18.w,
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.ABOUT);
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Tentang",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.w,
                                ),
                                Card(
                                  color: const Color.fromARGB(255, 132, 36, 12),
                                  elevation: 5,
                                  child: SizedBox(
                                    width: 1.sh * 0.55,
                                    height: 18.w,
                                    child: InkWell(
                                      onTap: () {
                                        GlobalSlideFromBottomDialog.show(context: context, child: HistoryWidget());
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Riwayat",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
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
                      right: 100.w,
                      bottom: 52.w,
                      child: IconButton(
                          onPressed: () {
                            GlobalSlideFromBottomDialog.show(context: context, child: TutorialGameplay());
                          },
                          icon: Container(
                            padding: EdgeInsets.all(2.w),
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(90.w), border: Border.all(width: 2)),
                            child: const Icon(
                              Icons.question_mark,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ],
                ),
              ));
        });
  }
}
