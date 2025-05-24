import 'package:flutter/material.dart';
import 'package:geduq_apps/app/data/controller/tutorial_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TutorialGameplay extends StatelessWidget {
  const TutorialGameplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 300.w,
          height: Get.height - 10.w,
          decoration: BoxDecoration(
              color: const Color.fromARGB(178, 132, 36, 12),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.yellow)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 25.w,
                    height: 10.w,
                  ),
                  Text(
                    "Petunjuk Permainan",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10.sp),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);

                        final tutorialStorage = Get.find<TutorialStorage>();
                        tutorialStorage.hideTutorial();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 15.dg,
                      )),
                ],
              ),
              SizedBox(
                width: 1.sw * 0.75,
                height: 1.sh * 0.75,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image:
                                    DecorationImage(image: AssetImage("assets/images/tutorial_home.png"), fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                "Untuk memulai permainan, User bisa langsung klik tombol 'Permainan'.",
                                style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                "Setelah itu, User akan memilih karakter. Kemudian mengetik username yang ingin User gunakan. Dan terakhir, User hanya tinggal menekan tombol lanjut.",
                                style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_select.png"), fit: BoxFit.fill)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image:
                                    DecorationImage(image: AssetImage("assets/images/tutorial_map.jpeg"), fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                "Setelah itu, layar akan menampilkan peta permainan yang harus User ikuti sampai pada level yang terakhir.",
                                style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Terdapat beberapa jenis ikon pada peta permainan sebagai berikut.",
                            style: TextStyle(color: Colors.white, fontSize: 7.sp),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 25.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/tutorial_map_active_albab.jpeg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: SizedBox(
                                  child: Text(
                                    "Jika memilih karakter 'Albab' dan level telah terbuka. User hanya tinggal menekan ikon ini untuk melanjutkan permainan",
                                    style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 25.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/tutorial_map_active_ulil.jpeg"), fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: SizedBox(
                                  child: Text(
                                    "Jika memilih karakter 'Ulil' dan level telah terbuka. User hanya tinggal menekan ikon ini untuk melanjutkan permainan",
                                    style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 20.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/tutorial_map_inactive.jpeg"), fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: SizedBox(
                                  child: Text(
                                    "Level belum dibuka",
                                    style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 20.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/tutorial_map_true.jpeg"), fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: SizedBox(
                                  child: Text(
                                    "Soal dijawab dengan benar.",
                                    style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 20.w,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/tutorial_map_false.jpeg"), fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: SizedBox(
                                  child: Text(
                                    "Soal dijawab dengan salah.",
                                    style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    "Setelah itu, terdapat soal yang harus dikerjakan oleh User dengan terdapat beberapa ketentuan diantaranya:",
                                    style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1. ",
                                        style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            "Terdapat nyawa yang jika User menjawab salah, maka nyawa tersebut akan berkurang 1 buah. Jika nyawa habis, maka permainan akan langsung berakhir.",
                                            style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "2. ",
                                        style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            "Terdapat waktu dengan hitungan maju untuk mengukur seberapa lama User dapat menyelesaikan permainan.",
                                            style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "3. ",
                                        style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            "Untuk memainkan sound.",
                                            style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "4. ",
                                        style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            "Pertanyaan yang ditanyakan kepada User.",
                                            style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "5. ",
                                        style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Flexible(
                                        child: SizedBox(
                                          child: Text(
                                            "Pilihan jawaban yang disediakan.",
                                            style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_soal_biasa.png"), fit: BoxFit.fill)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_soal_biasa_done.png"), fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                "Setelah User memilih salah satu jawaban yang dianggap benar, tombol 'Selesai' akan muncul dibawahnya. Dan User hanya perlu menekan tombol tersebut untuk melanjutkan ke level berikutnya.",
                                style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                "Sedangkan untuk soal susun ayat, User dapat menekan ikon sound untuk memainkan sound. Kemudian User memilih jawaban yang disediakan dengan mengurutkannya.",
                                style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_susun_ayat.png"), fit: BoxFit.fill)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_susun_ayat_done.png"), fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                "Setelah User memilih 3 pilihan yang disediakan, maka tombol 'Selesai' akan muncul dibawahnya. Dan User hanya perlu menekan tombol tersebut untuk melanjutkan ke level berikutnya.",
                                style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      const Divider(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                "Setelah User menyelesaikan semua level, maka permainan telah berakhir dan User mendapatkan skor akhir.",
                                style: TextStyle(color: Colors.white, fontSize: 7.sp),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 120.w,
                            height: 60.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_game_ended.jpeg"), fit: BoxFit.fill)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
