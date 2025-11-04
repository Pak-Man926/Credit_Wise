import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loan_offers_controller.dart';

class LoanOffersView extends GetView<LoanOffersController> {
  const LoanOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personalized Loan Offers')),
      body: Center(
        child: Obx(() => ListView.builder(
          itemCount: controller.offers.length,
          itemBuilder: (context, index) {
            final offer = controller.offers[index];
            return ListTile(
              title: Text(offer['bank']!),
              subtitle: Text('Amount: ${offer['amount']}, Rate: ${offer['rate']}'),
            );
          },
        )),
      ),
    );
  }
}
