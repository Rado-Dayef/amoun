import 'package:amoun/controllers/get_started_controller.dart';
import 'package:amoun/controllers/home_controller.dart';
import 'package:amoun/controllers/login_controller.dart';
import 'package:amoun/controllers/reset_password_controller.dart';
import 'package:amoun/controllers/signup_controller.dart';
import 'package:amoun/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => GetStartedController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
  }
}
