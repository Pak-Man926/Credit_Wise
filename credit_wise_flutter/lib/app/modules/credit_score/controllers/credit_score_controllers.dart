import 'package:get/get.dart';

class CreditScoreController extends GetxController {
  // Reactive variable to hold the credit score value
  var score = 750.obs;

  @override
  void onInit() {
    // Simulate fetching the score on screen load
    fetchCreditScore();
    super.onInit();
  }

  void fetchCreditScore() async {
    // Simulate API delay
    await 2.seconds.delay();
    score.value = 780; // Update with fetched data
  }
}
