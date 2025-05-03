import 'package:amoun/constants/extensions.dart';
import 'package:amoun/constants/strings.dart';
import 'package:amoun/models/services/auth_services.dart';
import 'package:amoun/models/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserModel user = Get.arguments[0];
  String selectedScreen = AppStrings.homeText;

  List visitedPlaces = [
    {
      "name": "aswan",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLQLZJeihAolC_8zbGrC56Xs1Qql7oIkLyCQ&s",
    },
    {
      "name": "Alexandria",
      "image": "https://www.egypttoursportal.com/images/2017/11/Alexandria-City-Egypt-Egypt-Tours-Portal.jpg",
    },
    {
      "name": "Sharm El Sheikh",
      "image": "https://assets.live.dxp.maginfrastructure.com/f/73114/3000x2250/c65d44f666/ema_sharm-el-sheikh-hero_3000x2250.jpg",
    },
  ];

  signOut() {
    FirebaseAuthService().signOut().then(
      (value) {
        Get.offNamed(AppStrings.loginRoute);
      },
    ).catchError(
      (error) {
        error.toString().showToast;
      },
    );
  }
}
