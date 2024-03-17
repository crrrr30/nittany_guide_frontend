import 'package:get/get.dart';
import 'package:nittany_guide_frontend/common/routes/index.dart';
import 'package:nittany_guide_frontend/pages/application/index.dart';
import 'package:nittany_guide_frontend/pages/recommendation/index.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.APPLICATION,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.RECOMMENDATION,
      page: () => const RecommendationPage(),
      binding: RecommendationBinding(),
    ),
  ];
}
