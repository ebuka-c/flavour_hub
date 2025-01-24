import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flavor_hub/page_routes/route_name.dart';
import 'package:flavor_hub/page_routes/route_pages.dart';
import 'bindings/app_bindings.dart';
import 'services/theme/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await GetStorage.init();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAfo_jGhGXQwwyYbjxlRhTVGa8KHG1MGhI",
          appId: "1:959694560903:android:7b9598c22d28253528e222",
          messagingSenderId: "959694560903",
          projectId: "flavour-hub-c3187"));
  AppBindings().dependencies();
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppThemes().lightTheme,
      getPages: RoutePages.routes,
      initialRoute: AppRoutes.splashScreen,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
