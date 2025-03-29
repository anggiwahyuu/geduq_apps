import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/controllers/audio_controllers.dart';
import 'package:geduq_apps/views/materi_in_house/enter_house.dart';
import 'package:geduq_apps/views/materi_in_house/materi_1.dart';
import 'package:geduq_apps/views/materi_in_house/materi_10.dart';
import 'package:geduq_apps/views/materi_in_house/materi_11.dart';
import 'package:geduq_apps/views/materi_in_house/materi_2.dart';
import 'package:geduq_apps/views/materi_in_house/materi_3.dart';
import 'package:geduq_apps/views/materi_in_house/materi_4.dart';
import 'package:geduq_apps/views/materi_in_house/materi_5.dart';
import 'package:geduq_apps/views/materi_in_house/materi_6.dart';
import 'package:geduq_apps/views/materi_in_house/materi_7.dart';
import 'package:geduq_apps/views/materi_in_house/materi_8.dart';
import 'package:geduq_apps/views/materi_in_house/materi_9.dart';
import 'package:geduq_apps/views/pre_test_gameplay/gameplay_arti_ayat.dart';
import 'package:geduq_apps/views/pre_test_gameplay/gameplay_sambung_ayat.dart';
import 'package:geduq_apps/views/pre_test_gameplay/gameplay_susun_ayat.dart';
import 'package:geduq_apps/views/pre_test_gameplay/gameplay_tebak_arti_surah.dart';
import 'package:geduq_apps/views/pre_test_gameplay/gameplay_tebak_surah.dart';
import 'package:geduq_apps/views/pre_test_gameplay/stage_select.dart';
import 'package:geduq_apps/views/main_menu/about_view.dart';
import 'package:geduq_apps/views/main_menu/home_view.dart';
import 'package:geduq_apps/views/splash_screen/splash_screen_view1.dart';
import 'package:geduq_apps/views/splash_screen/splash_screen_view2.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AudioController());

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'GEDUQ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => const SplashScreenViewOne()),
          GetPage(name: "/splash_two", page: () => const SplashScreenViewTwo()),
          GetPage(name: "/home", page: () => HomeView()),
          GetPage(name: "/about", page: () => AboutView()),
          GetPage(name: "/stage_select", page: () => StageSelect()),
          GetPage(
              name: "/gameplay_sambung_ayat",
              page: () => GameplaySambungAyat()),
          GetPage(
              name: "/gameplay_tebak_arti",
              page: () => GameplayTebakArtiSurah()),
          GetPage(
              name: "/gameplay_nama_surat_dari_ayat",
              page: () => GameplayTebakSurah()),
          GetPage(
              name: "/gameplay_susun_ayat", page: () => GameplaySusunAyat()),
          GetPage(name: "/gameplay_arti_ayat", page: () => GameplayArtiAyat()),
          GetPage(name: "/enter_house", page: () => EnterHouse()),
          GetPage(name: "/materi_house_1", page: () => MateriOne()),
          GetPage(name: "/materi_house_2", page: () => MateriTwo()),
          GetPage(name: "/materi_house_3", page: () => MateriThree()),
          GetPage(name: "/materi_house_4", page: () => MateriFour()),
          GetPage(name: "/materi_house_5", page: () => MateriFive()),
          GetPage(name: "/materi_house_6", page: () => MateriSix()),
          GetPage(name: "/materi_house_7", page: () => MateriSeven()),
          GetPage(name: "/materi_house_8", page: () => MateriEight()),
          GetPage(name: "/materi_house_9", page: () => MateriNine()),
          GetPage(name: "/materi_house_10", page: () => MateriTen()),
          GetPage(name: "/materi_house_11", page: () => MateriEleven())
        ],
      ),
    );
  }
}
