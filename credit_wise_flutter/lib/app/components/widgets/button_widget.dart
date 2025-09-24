import "package:flutter/material.dart";

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double width;
  final double height;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width = double.infinity,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
