// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_controller.dart';
import 'package:get/get.dart';

class MateriAdab extends StatelessWidget {
  const MateriAdab({super.key});

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
                        Text(
                          _.itemAdab[_.randomPickAdab]["title"],
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: _.itemAdab[_.randomPickAdab]["content"].length,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(alignment: Alignment.topLeft, child: Text("${index + 1}. ")),
                                  Expanded(
                                      child: SizedBox(
                                    child: Text(_.itemAdab[_.randomPickAdab]["content"][index]),
                                  ))
                                ],
                              );
                            },
                          ),
                        ),
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
                              )),
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
