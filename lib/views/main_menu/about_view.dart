import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geduq_apps/data/about_data.dart';
import 'package:get/get.dart';

class AboutView extends StatelessWidget {
  AboutView({super.key});

  final visible = false.obs;
  final visible2 = false.obs;
  final visible3 = false.obs;
  final visible4 = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Obx(
            () => Column(
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
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
            
                InkWell(
                  onTap: () {
                    if (visible.isFalse) {
                      visible.value = true;
                    } else {
                      visible.value = false;
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        (visible.value == false ? CupertinoIcons.arrowtriangle_right_fill : CupertinoIcons.arrowtriangle_down_fill)
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Tentang Aplikasi", 
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
            
                Visibility(
                  visible: visible.value,
                  child: Text(Data().tentangApk, textAlign: TextAlign.justify,),
                ),
            
                const SizedBox(height: 15,),
            
                InkWell(
                  onTap: () {
                    if (visible2.isFalse) {
                      visible2.value = true;
                    } else {
                      visible2.value = false;
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        (visible2.value == false ? CupertinoIcons.arrowtriangle_right_fill : CupertinoIcons.arrowtriangle_down_fill)
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Petunjuk Penggunaan", 
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
            
                Visibility(
                  visible: visible2.value,
                  child: Text(Data().petunjukPenggunaan, textAlign: TextAlign.justify,),
                ),
            
                const SizedBox(height: 15,),
            
                InkWell(
                  onTap: () {
                    if (visible3.isFalse) {
                      visible3.value = true;
                    } else {
                      visible3.value = false;
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        (visible3.value == false ? CupertinoIcons.arrowtriangle_right_fill : CupertinoIcons.arrowtriangle_down_fill)
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Capaian Pembelajaran", 
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
            
                Visibility(
                  visible: visible3.value,
                  child: Text(Data().capaianPembelajaran, textAlign: TextAlign.justify,),
                ),
            
                const SizedBox(height: 15,),
            
                InkWell(
                  onTap: () {
                    if (visible4.isFalse) {
                      visible4.value = true;
                    } else {
                      visible4.value = false;
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        (visible4.value == false ? CupertinoIcons.arrowtriangle_right_fill : CupertinoIcons.arrowtriangle_down_fill)
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Ucapan Terima Kasih", 
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
            
                Visibility(
                  visible: visible4.value,
                  child: Text(Data().ucapanTerimakasih, textAlign: TextAlign.justify,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}