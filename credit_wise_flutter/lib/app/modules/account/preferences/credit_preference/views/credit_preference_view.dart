import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/credit_preference_controller.dart';

class CreditPreferenceView extends GetView<CreditPreferenceController> {
  const CreditPreferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreditPreferenceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreditPreferenceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
