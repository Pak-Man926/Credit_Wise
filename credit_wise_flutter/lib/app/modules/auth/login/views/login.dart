import "package:credit_wise_flutter/app/components/widgets/textfield_widget.dart";
import "package:flutter/material.dart";
import "package:credit_wise_flutter/themes/app_theme.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Welcome Back",
          style: AppTextStyles.headingXL,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFieldWidget(
              hintText: "Email or username",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              hintText: ("Password"),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ]
        ),
      ),
    );
  }
}
