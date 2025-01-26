import 'package:flavor_hub/screens/auth/account_recovery/forgot_pwd.dart';
import 'package:flavor_hub/screens/auth/sign_up_screen.dart';
import 'package:flavor_hub/screens/main_screens/secondary/upload_recipe.dart';
import 'package:flavor_hub/widgets/nav_bar.dart';
import 'package:get/get.dart';
import 'package:flavor_hub/screens/onboarding/onboarding.dart';
import '../screens/auth/login_screen.dart';
import '../screens/main_screens/home_screen.dart';
import '../screens/main_screens/secondary/recipe_screen.dart';
import '../screens/main_screens/secondary/recipes_by_you.dart';
import '../screens/main_screens/secondary/search_screen.dart';
import '../screens/select_expertise.dart';
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
    GetPage(
      name: AppRoutes.forgotPwd,
      page: () => const ForgotPassword(),
    ),
    GetPage(
      name: AppRoutes.selectExpertise,
      page: () => SelectExpertise(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.navBar,
      page: () => NavBar(),
    ),
    GetPage(
      name: AppRoutes.searchScreen,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: AppRoutes.recipeScreen,
      page: () => RecipeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.uploadRecipe,
      page: () => UploadRecipe(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.byYou,
      page: () => RecipesByYou(),
      transition: Transition.fadeIn,
    ),
  ];
}
