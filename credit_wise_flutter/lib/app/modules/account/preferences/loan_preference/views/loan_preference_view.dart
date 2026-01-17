import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loan_preference_controller.dart';

class LoanPreferenceView extends GetView<LoanPreferenceController> {
  const LoanPreferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoanPreferenceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoanPreferenceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
