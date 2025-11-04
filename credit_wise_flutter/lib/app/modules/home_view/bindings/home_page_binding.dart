import 'package:get/get.dart';
import '../../account/controllers/account_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../loan_offers/controllers/loan_offers_controller.dart';
import '../controllers/home_page_controller.dart';
import '../../credit_score/controllers/credit_score_controllers.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<CreditScoreController>(
      () => CreditScoreController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LoanOffersController>(
      () => LoanOffersController(),
    );
  }
}
