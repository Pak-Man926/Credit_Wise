import 'package:get/get.dart';

class CreditScoreController extends GetxController {
  // Reactive variable to hold the credit score value
  final touchedIndex = (-1).obs; 

  // Function to set the touched index
  void setTouchedIndex(int index) {
    touchedIndex.value = index;
  }

  @override
  void onInit() {
    // Simulate fetching the score on screen load
    fetchCreditScore();
    super.onInit();
  }

  void fetchCreditScore() async {
    // Simulate API delay
    await 2.seconds.delay();
    //score.value = 780; // Update with fetched data
  }
}
