import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";
import "package:flutter/material.dart";

class LoanOffersFeedWidget extends StatelessWidget {
  const LoanOffersFeedWidget({
    super.key,
    required this.headlineText,
    required this.bottomlineText,
    required this.onPressed,
    required this.image,
    required this.midlineText,
    required this.buttonLabel,
    this.color = const Color.fromARGB(255, 220, 226, 233),
    this.textStyle = AppTextStyles.button,
  });

  final String? headlineText;
  final String? midlineText;
  final String? bottomlineText;
  final void Function()? onPressed;
  final String? image;
  final String buttonLabel;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 180,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: Colors.grey.shade400, // border color
          //   width: 1.5, // border thickness
          // ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$headlineText", style: AppTextStyles.bodySmall),
                  smallSpaceSize,
                  Text(
                    "$midlineText",
                    style: AppTextStyles.body,
                  ),
                  smallSpaceSize,
                  Text("$bottomlineText", style: AppTextStyles.bodySmall),
                  mediumSpaceSize,
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("$buttonLabel", style: textStyle),
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 140,
                width: 120,
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
