import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? icon;
  const AppCircleButton({this.onTap, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(55),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .scaffoldBackgroundColor
                  .withOpacity(0.7)
                  .withOpacity(0.4), // Glow color
              blurRadius: 10, // Spread of the glow
              spreadRadius: -2, // Intensity of the glow
            ),
          ],
        ),
        child: icon ??
            const Icon(
              Icons.arrow_back,
              color: Color(0xFF3F414E),
            ),
      ),
    );
  }
}
