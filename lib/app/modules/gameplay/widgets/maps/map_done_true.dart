import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapDoneTrue extends StatelessWidget {
  const MapDoneTrue({super.key});

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
            child: Text(
                "Anda sudah menyelesaikan level ini. Silakan kerjakan level selanjutnya"),
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
      icon: Stack(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.red,
            size: 18.w,
          ),
          Icon(
            Icons.check,
            color: Colors.green,
            size: 18.w,
          )
        ],
      ),
    );
  }
}
