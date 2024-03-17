import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:nittany_guide_frontend/common/components.dart";
import "package:nittany_guide_frontend/common/http_service.dart";
import "package:nittany_guide_frontend/common/routes/index.dart";

class ApplicationController extends GetxController {
  String? id, major, campus;
  RxString filename = "".obs;

  Future<void> onSubmitted(BuildContext context, String query) async {
    if (id == null) {
      AppComponents.showSnackBar("What-If Report not uploaded!");
      return;
    }
    if (major == null) {
      AppComponents.showSnackBar("Major not selected!");
      return;
    }
    if (campus == null) {
      AppComponents.showSnackBar("Campus not selected!");
      return;
    }

    AppComponents.showLoadingDialog(context);
    final recommendation =
        await HttpService.recommend(id!, major!, campus!, query);
    Navigator.pop(context);
    if (recommendation == null) {
      AppComponents.showSnackBar("Request failed!");
      return;
    }
    Get.toNamed(AppRoutes.RECOMMENDATION, arguments: recommendation);
  }
}
