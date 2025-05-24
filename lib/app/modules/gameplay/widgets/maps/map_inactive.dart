import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapInactive extends StatelessWidget {
  const MapInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          AlertDialog alert = AlertDialog(
            title: const Text(
              "Peringatan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const SizedBox(
              child: Text("Kerjakan level sebelumnya"),
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("OK"),
              ),
            ],
          );
          showDialog(context: context, builder: (context) => alert);
        },
        icon: Icon(
          Icons.location_off_outlined,
          color: Colors.red,
          size: 18.w,
        ));
  }
}
