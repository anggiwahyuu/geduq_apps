import 'package:flutter/material.dart';

class BackgroundGame extends StatelessWidget{
  const BackgroundGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_game.png"),
          fit: BoxFit.fill
        )
      ),
    );
  }
}