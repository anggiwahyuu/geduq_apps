import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/model/ayat_response.dart';
import 'package:geduq_apps/app/data/controller/audio_controllers.dart';
import 'package:geduq_apps/app/modules/materi/controllers/materi_controller.dart';
import 'package:geduq_apps/app/globalwidgets/background_game_3.dart';
import 'package:get/get.dart';

class MateriSurahView extends StatelessWidget {
  final Surah data;
  final int index;
  const MateriSurahView({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioController>(builder: (audio) {
      return GetBuilder<MateriController>(builder: (_) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            audio.stopSound();
            if (!didPop) {
              Get.back();
            }
          },
          child: Scaffold(
            body: Stack(
              children: [
                const BackgroundGameThree(),
                Positioned(
                  top: 35.h,
                  left: (index + 1) < 10 ? 37.w : 34.w,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 260.w,
                    height: 1.sh * 0.7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Membaca QS. ${data.surah}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Transform.flip(
                                      flipX: true,
                                      child: IconButton(
                                          onPressed: () async {
                                            await audio.playSound("sounds/taawudz.mp3");
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
                                          "أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ",
                                          style: TextStyle(fontSize: 13.sp),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "A'udzubillaahi minasy syaithaanir rajiim",
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 7.sp, fontStyle: FontStyle.italic),
                              ),
                              Text(
                                "Aku berlindung kepada Allah dari godaan setan yang terkutuk",
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 7.sp),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              if (data.id != 0)
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Transform.flip(
                                            flipX: true,
                                            child: IconButton(
                                                onPressed: () async {
                                                  await audio.playSound("sounds/basmallah.mp3");
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
                                                "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                                                style: TextStyle(fontSize: 13.sp),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Bismillaahirrahmaanirrahiim",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 7.sp, fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      "Dengan menyebut nama Allah yang Maha Pengasih lagi Maha Penyayang",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 7.sp),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 12.h,
                              ),
                              SizedBox(
                                child: Column(
                                  children: List.generate(data.ayatArabic!.length, (index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Transform.flip(
                                                flipX: true,
                                                child: IconButton(
                                                    onPressed: () async {
                                                      await audio.playSound(data.sound![index]);
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
                                                    data.ayatArabic![index],
                                                    style: TextStyle(fontSize: 13.sp),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          data.ayatLatin![index],
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 7.sp, fontStyle: FontStyle.italic),
                                        ),
                                        Text(
                                          data.arti![index],
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 7.sp),
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Card(
                              color: Colors.green,
                              child: InkWell(
                                child: SizedBox(
                                  width: 80.w,
                                  height: 45.h,
                                  child: Center(
                                    child: Text(
                                      "Saya Mengerti",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _.addMateriOpened(index);
                                  audio.stopSound();
                                  Get.back();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
    });
  }
}
