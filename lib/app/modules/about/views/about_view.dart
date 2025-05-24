import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geduq_apps/app/data/utils/about_data.dart';
import 'package:geduq_apps/app/modules/about/controllers/about_controller.dart';
import 'package:get/get.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(builder: (aboutCtrl) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo_apk.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    aboutCtrl.setVisible();
                  },
                  child: Row(
                    children: [
                      Icon((aboutCtrl.visible == false
                          ? CupertinoIcons.arrowtriangle_right_fill
                          : CupertinoIcons.arrowtriangle_down_fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Tentang Aplikasi",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: aboutCtrl.visible,
                  child: Text(
                    AboutData().tentangApk,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    aboutCtrl.setVisible2();
                  },
                  child: Row(
                    children: [
                      Icon((aboutCtrl.visible2 == false
                          ? CupertinoIcons.arrowtriangle_right_fill
                          : CupertinoIcons.arrowtriangle_down_fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Petunjuk Penggunaan",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: aboutCtrl.visible2,
                  child: Text(
                    AboutData().petunjukPenggunaan,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    aboutCtrl.setVisible3();
                  },
                  child: Row(
                    children: [
                      Icon((aboutCtrl.visible3 == false
                          ? CupertinoIcons.arrowtriangle_right_fill
                          : CupertinoIcons.arrowtriangle_down_fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Capaian Pembelajaran",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: aboutCtrl.visible3,
                  child: Text(
                    AboutData().capaianPembelajaran,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    aboutCtrl.setVisible4();
                  },
                  child: Row(
                    children: [
                      Icon((aboutCtrl.visible4 == false
                          ? CupertinoIcons.arrowtriangle_right_fill
                          : CupertinoIcons.arrowtriangle_down_fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Ucapan Terima Kasih",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: aboutCtrl.visible4,
                  child: Text(
                    AboutData().ucapanTerimakasih,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
