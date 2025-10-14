import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/credit_score_controllers.dart';

class CreditScoreView extends GetView<CreditScoreController> {
  const CreditScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Credit Score')),
      body: Center(
        child: Obx(() => Text('Score: ${controller.score.value}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
