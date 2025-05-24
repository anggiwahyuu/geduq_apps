import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/controller/audio_controllers.dart';
import 'package:geduq_apps/app/data/utils/image_helper.dart';
import 'package:geduq_apps/app/globalwidgets/background_game_2.dart';
import 'package:geduq_apps/app/modules/materi/controllers/materi_controller.dart';
import 'package:get/get.dart';

class MateriView extends GetView<MateriController> {
  const MateriView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (audio) {
      return GetBuilder<MateriController>(builder: (_) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            Get.back();

            _.setIsCanPauseBackgroundAudio(false);

            Future.delayed(const Duration(seconds: 1), () {
              audio.playBackgroundSound(0.5);
            });
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Get.back();

                  _.setIsCanPauseBackgroundAudio(false);

                  Future.delayed(const Duration(seconds: 1), () {
                    audio.playBackgroundSound(0.5);
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
                        children: List.generate(_.pagesMateri.length, (index) {
                          return InkWell(
                            child: Container(
                              width: 50.w,
                              height: 35.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: _.materiOpened.contains(_.pagesMateri[index])
                                          ? const AssetImage(ImageHelper.imgMateriOpenedPng)
                                          : const AssetImage(ImageHelper.imgMateriClosePng),
                                      fit: BoxFit.fill)),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.sp),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(() => _.pagesMateri[index]);
                            },
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
