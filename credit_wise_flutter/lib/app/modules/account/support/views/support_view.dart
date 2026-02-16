import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SupportView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SupportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
