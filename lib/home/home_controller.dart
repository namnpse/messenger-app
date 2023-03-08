
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt bottomIndex = 0.obs;

  @override
  void onInit() async {
    final int? initPage = Get.arguments;
    if (initPage != null) {
      setBottomIndex(initPage);
    }
    super.onInit();
  }

  setBottomIndex(int offset) {
    bottomIndex.value = offset;
  }
}