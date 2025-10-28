import 'package:get/get.dart';
import '../controllers/credit_score_controllers.dart';

class CreditScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditScoreController>(
      () => CreditScoreController(),
    );
  }
}
