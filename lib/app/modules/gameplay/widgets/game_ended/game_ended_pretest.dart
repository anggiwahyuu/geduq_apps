import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/utils/image_helper.dart';
import 'package:geduq_apps/app/globalwidgets/globalslidefrombutton.dart';
import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_controller.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:geduq_apps/app/modules/home/widgets/history_widget.dart';
import 'package:geduq_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class GameEndedPreTest extends StatelessWidget {
  const GameEndedPreTest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameplayController>(builder: (_) {
      if (_.levelDone.contains(10)) {
        return Stack(
          children: [
            Container(
              width: 1.sw,
              height: 1.sh,
              decoration: const BoxDecoration(color: Color.fromARGB(95, 0, 0, 0)),
              child: Center(
                child: Container(
                  width: 1.sw * 0.5,
                  height: 1.sh,
                  padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.w, bottom: 10.w),
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/background_victory.png"), fit: BoxFit.fill)),
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
                                    image: _.character == "Albab"
                                        ? const AssetImage(ImageHelper.imgAlbabMainPng)
                                        : const AssetImage(ImageHelper.imgUlilMainPng),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            children: [
                              Text(
                                _.currentUsername,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
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
                        padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 18.w),
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
                            Text("${_.score} / 100", style: TextStyle(fontSize: 8.sp))
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
                                    GlobalSlideFromBottomDialog.show(context: context, child: HistoryWidget());
                                  },
                                  icon: Icon(
                                    Icons.note,
                                    size: 22.w,
                                    color: Colors.black,
                                  ),
                                ),
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
                                    _.resetAll();

                                    final homeCtrl = Get.find<HomeController>();
                                    homeCtrl.resetAll();

                                    Get.offAllNamed(Routes.HOME);
                                  },
                                  icon: Icon(
                                    Icons.home,
                                    size: 22.w,
                                    color: Colors.black,
                                  ),
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
            // HistoryGame(isVisible: isHistoryShown)
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
