import "package:flutter/material.dart";

class TextBoxWidget extends StatelessWidget {
  final String? hintText;
  //final keyboardType;

  const TextBoxWidget({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 220, 226, 233),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: hintText,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
        ),
      ),
    );
  }
}
