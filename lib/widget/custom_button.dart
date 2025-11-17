import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(1),
      onTap: onPressed,
      overlayColor: WidgetStateProperty.all(Colors.white),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.4, // move here!
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        alignment: Alignment.center, // centers text
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.black, fontSize: 20),
          child: child,
        ),
      ),
    );
  }
}
