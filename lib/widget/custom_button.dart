import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(standardBorderRadius),
      onTap: onPressed,
      overlayColor: WidgetStateProperty.all(const Color(0xFF9077B0)),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.3, // move here!
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(standardBorderRadius),
          color: Theme.of(context).colorScheme.primary,
        ),
        alignment: Alignment.center, // centers text
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: child,
        ),
      ),
    );
  }
}
