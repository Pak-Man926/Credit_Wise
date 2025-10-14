import 'package:get/get.dart';

class LoanOffersController extends GetxController {
  // Reactive list to hold loan offers data
  var offers = <Map<String, String>>[].obs;

  @override
  void onInit() {
    fetchLoanOffers();
    super.onInit();
  }

  void fetchLoanOffers() async {
    // Simulate API call to fetch offers based on user credit score
    await 1.seconds.delay();
    offers.addAll([
      {'bank': 'Global Bank', 'amount': '\$5,000', 'rate': '6.5%'},
      {'bank': 'Secure Finance', 'amount': '\$10,000', 'rate': '7.2%'},
      {'bank': 'Quick Cash Co', 'amount': '\$1,500', 'rate': '9.9%'},
    ]);
  }
}
