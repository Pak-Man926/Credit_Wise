import 'package:get/get.dart';
import '../controllers/loan_offers_controller.dart';

class LoanOffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanOffersController>(
      () => LoanOffersController(),
    );
  }
}
