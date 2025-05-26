// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_controller.dart';
import 'package:get/get.dart';

class MateriSKI extends StatelessWidget {
  const MateriSKI({super.key});

  // var isMateriVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameplayController>(builder: (_) {
      return Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 225, 136, 1), borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sejarah Kebudayaan Islam",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: const TextStyle(fontSize: 15, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "${_.itemSejarah[_.randomPickSejarah]["title"]} ",
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: _.itemSejarah[_.randomPickSejarah]["information"])
                              ],
                            )),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _.setMateriVisibility(false);

                              Future.delayed(Duration(milliseconds: 1000)).then((value) {
                                _.readMateriJson();
                              });
                            },
                            icon: const Icon(
                              Icons.keyboard_double_arrow_right,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
