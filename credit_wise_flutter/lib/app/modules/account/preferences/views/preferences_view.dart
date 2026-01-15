import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/preferences_controller.dart';

class PreferencesView extends GetView<PreferencesController> {
  const PreferencesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreferencesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PreferencesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
