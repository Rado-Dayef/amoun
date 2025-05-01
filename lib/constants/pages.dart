import 'package:amoun/constants/strings.dart';
import 'package:amoun/views/screens/get_started_screen.dart';
import 'package:amoun/views/screens/login_screen.dart';
import 'package:amoun/views/screens/nev_screen.dart';
import 'package:amoun/views/screens/reset_password_screen.dart';
import 'package:amoun/views/screens/signup_screen.dart';
import 'package:amoun/views/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppStrings.homeRoute, page: () => const NavScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.loginRoute, page: () => const LoginScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.splashRoute, page: () => const SplashScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.signupRoute, page: () => const SignUpScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.getStartedRoute, page: () => const GetStartedScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.resetPasswordRoute, page: () => const ResetPasswordScreen(), transition: Transition.noTransition),
  ];
}
