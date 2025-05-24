import 'package:flutter/material.dart';

class BackgroundGameTwo extends StatelessWidget{
  const BackgroundGameTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_game_2.png"),
          fit: BoxFit.fill
        )
      ),
    );
  }
}