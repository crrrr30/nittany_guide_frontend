import "package:get/get.dart";
import "package:nittany_guide_frontend/pages/application/index.dart";

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
  }
}
