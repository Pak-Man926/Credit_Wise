import "package:flutter/material.dart";

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    this.profile_pic,});

  final Image? profile_pic;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset("$profile_pic"),
    ));
  }
}
