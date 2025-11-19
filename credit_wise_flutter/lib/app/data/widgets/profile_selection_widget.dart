import "package:flutter/material.dart";

import "../../theme/app_text_styles.dart";

class ProfileSelectionWidget extends StatelessWidget {
  const ProfileSelectionWidget({
    super.key,
    required this.accountSelection,
    required this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward_ios_rounded,
  });

  final String? accountSelection;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {},
        child: Row(children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Icon(
              leadingIcon,
              size: 15,
            ),
          ),
          Text("$accountSelection", style: AppTextStyles.body),
          const Spacer(),
          Icon(
            trailingIcon,
            size: 15,
          ),
        ]),
      ),
    );
  }
}
