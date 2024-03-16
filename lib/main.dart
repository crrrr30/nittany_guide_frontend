import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittany_guide_frontend/common/http_service.dart';
import 'package:nittany_guide_frontend/common/routes/index.dart';

void main() {
  Get.put<HttpService>(HttpService());
  Get.put<GlobalKey<ScaffoldMessengerState>>(
      GlobalKey<ScaffoldMessengerState>());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TasteMate',
      theme: ThemeData.light(),
      initialRoute: AppRoutes.APPLICATION,
      getPages: AppPages.routes,
      scaffoldMessengerKey: Get.find<GlobalKey<ScaffoldMessengerState>>(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
