import 'package:flutter/material.dart';

class GlobalSlideFromBottomDialog {
  static show({required BuildContext context, required Widget child}) async {
    await Future.delayed(Duration.zero).then((value) {
      if (context.mounted) {
        showGeneralDialog(
          transitionDuration: Duration(milliseconds: 500),
          context: context,
          pageBuilder: (context, anim1, anim2) => child,
          transitionBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
            child: child,
          ),
        );
      }
    });
  }
}
