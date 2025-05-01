import 'package:amoun/constants/strings.dart';
import 'package:amoun/models/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserModel user = Get.arguments[0];
  String selectedScreen = AppStrings.homeText;
}
