import 'package:get/get.dart';
import 'package:flavor_hub/screens/onboarding/onboarding.dart';
import '../screens/onboarding/splash_screen.dart';
import 'route_name.dart';

class RoutePages {
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
  ];
}
