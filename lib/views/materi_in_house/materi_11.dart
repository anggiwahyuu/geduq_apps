import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/controllers/audio_controllers.dart';
import 'package:geduq_apps/controllers/ayat_materi_controller.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/views/components/background_game_3.dart';
import 'package:get/get.dart';

class MateriEleven extends StatelessWidget {
  MateriEleven({super.key});

  final GameController controller = Get.put(GameController());

  final AyatMateriController ayatMateriController = Get.put(AyatMateriController());

  final audioController = Get.find<AudioController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGameThree(),

          Positioned(
            top: 35.h,
            left: 34.w,
            child: Text(
              "11",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.w,
              height: 250.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Membaca QS. An-Naas",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp
                      ),
                    ),

                    const SizedBox(height: 10,),

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
                                    await audioController.playSound("sounds/taawudz.mp3");
                                  },
                                  icon: Icon(
                                    Icons.volume_up,
                                    size: 18.dm,
                                  )
                                ),
                              ),
                            
                              SizedBox(width: 5.w,),

                              Flexible(
                                child: SizedBox(
                                  child: Text(
                                    "أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ",
                                    style: TextStyle(
                                      fontSize: 13.sp
                                    ),
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
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        
                        Text(
                          "Aku berlindung kepada Allah dari godaan setan yang terkutuk",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 7.sp
                          ),
                        ),
                        
                        SizedBox(height: 12.h,),
                        
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Transform.flip(
                                flipX: true,
                                child: IconButton(
                                  onPressed: () async {
                                    await audioController.playSound("sounds/basmallah.mp3");
                                  },
                                  icon: Icon(
                                    Icons.volume_up,
                                    size: 18.dm,
                                  )
                                ),
                              ),
                            
                              SizedBox(width: 5.w,),

                              Flexible(
                                child: SizedBox(
                                  child: Text(
                                    "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                                    style: TextStyle(
                                      fontSize: 13.sp
                                    ),
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
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        
                        Text(
                          "Dengan menyebut nama Allah yang Maha Pengasih lagi Maha Penyayang",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 7.sp
                          ),
                        ),
                        
                        SizedBox(height: 12.h,),

                        Obx(() {
                          if (ayatMateriController.itemsAnNaas.isNotEmpty) {
                            final items = ayatMateriController.itemsAnNaas[0];

                            return SizedBox(
                              child: Column(
                                children: List.generate(items["ayat_arabic"].length, (index) {
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
                                                  await audioController.playSound(items["sound"][index]);
                                                }, 
                                                icon: Icon(
                                                  Icons.volume_up,
                                                  size: 18.dm,
                                                )
                                              ),
                                            ),
                                          
                                            SizedBox(width: 5.w,),

                                            Flexible(
                                              child: SizedBox(
                                                child: Text(
                                                  items["ayat_arabic"][index],
                                                  style: TextStyle(
                                                    fontSize: 13.sp
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Text(
                                        items["ayat_latin"][index],
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 7.sp,
                                          fontStyle: FontStyle.italic
                                        ),
                                      ),
                                      
                                      Text(
                                        items["arti"][index],
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 7.sp
                                        ),
                                      ),
                                      
                                      SizedBox(height: 12.h,),
                                    ],
                                  );
                                }),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 7.sp,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            controller.materiElevenIsOpen.value = true;
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
    );
  }
}