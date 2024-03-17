import "package:get/get.dart";
import "package:nittany_guide_frontend/pages/recommendation/index.dart";

class RecommendationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendationController>(() => RecommendationController());
  }
}
