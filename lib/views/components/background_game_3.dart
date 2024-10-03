import 'package:flutter/material.dart';

class BackgroundGameThree extends StatelessWidget{
  const BackgroundGameThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_game_3.png"),
          fit: BoxFit.fill
        )
      ),
    );
  }
}