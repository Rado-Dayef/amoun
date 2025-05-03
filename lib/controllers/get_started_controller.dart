import 'package:amoun/constants/extensions.dart';
import 'package:amoun/constants/strings.dart';
import 'package:amoun/models/services/get_started_image_model.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {
  int index = 0;
  List<GetStartedImageModel> getStartedImages = [
    GetStartedImageModel(AppStrings.abuElHoulText, index: 0, image: AppStrings.abuElHoulImage, opacity: 1.0, position: -60),
    GetStartedImageModel(AppStrings.abuSimpleTempleText, index: 1, image: AppStrings.abuSimbelTempleImage, opacity: 1.0, position: -60),
    GetStartedImageModel(AppStrings.theGreatSphinxOfGizaText, index: 2, image: AppStrings.theGreatSphinxOfGizaImage, opacity: 1.0, position: -60),
  ];

  @override
  void onInit() {
    Future.delayed(500.milSec, () {
      getStartedImages[0].opacity = 0.2;
      getStartedImages[0].position = 60;
      update();
    });
    super.onInit();
  }

  void incrementIndex() {
    if (index < 2) {
      index++;
      Future.delayed(500.milSec, () {
        for (GetStartedImageModel getStartedImage in getStartedImages) {
          if (getStartedImage.index == index) {
            getStartedImage.opacity = 0.2;
            getStartedImage.position = 60;
          } else {
            getStartedImage.opacity = 1.0;
            getStartedImage.position = -60;
          }
        }
        update();
      });
    } else {
      Get.toNamed(AppStrings.loginRoute);
    }
    update();
  }

  void decrementIndex() {
    if (index > 0) {
      index--;
      Future.delayed(500.milSec, () {
        for (GetStartedImageModel getStartedImage in getStartedImages) {
          if (getStartedImage.index == index) {
            getStartedImage.opacity = 0.2;
            getStartedImage.position = 60;
          } else {
            getStartedImage.opacity = 1.0;
            getStartedImage.position = -60;
          }
        }
        update();
      });
    }
    update();
  }
}
