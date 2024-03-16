import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittany_guide_frontend/common/components.dart';
import 'package:nittany_guide_frontend/common/http_service.dart';
import 'package:nittany_guide_frontend/common/routes/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<HttpService>(HttpService());
  Get.put<GlobalKey<ScaffoldMessengerState>>(
      GlobalKey<ScaffoldMessengerState>());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppComponents.dmSansTextTheme =
        GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme);
    AppComponents.dmSerifDisplayTextTheme =
        GoogleFonts.dmSerifDisplayTextTheme(Theme.of(context).textTheme);
    ThemeData theme = ThemeData.light();
    theme = theme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        dividerColor: Colors.transparent,
        textTheme: GoogleFonts.dmSansTextTheme());

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nittany Guide',
        theme: theme,
        initialRoute: AppRoutes.APPLICATION,
        getPages: AppPages.routes,
        scaffoldMessengerKey: Get.find<GlobalKey<ScaffoldMessengerState>>(),
      ),
    );
  }
}
