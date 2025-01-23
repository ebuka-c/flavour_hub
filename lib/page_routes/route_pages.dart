import 'package:flavor_hub/screens/auth/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:flavor_hub/screens/onboarding/onboarding.dart';
import '../screens/auth/login_screen.dart';
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
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => const LoginScreen(),
    ),
  ];
}
