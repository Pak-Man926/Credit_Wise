import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selection = "".obs;

  void selectedOption(String? value)
  {
    selection.value = value ?? "";
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
