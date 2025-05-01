import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:amoun/constants/strings.dart';
import 'package:amoun/controllers/get_started_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedScreen extends GetWidget<GetStartedController> {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: AppColors.darkNbetyColor, child: Image.asset(AppStrings.backgroundImage, width: double.infinity, height: double.infinity)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: 30.borderRadiusAll),
              color: AppColors.whiteColor,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(AppStrings.welcomeToAmounAppText, style: TextStyle(color: AppColors.darkNbetyColor, fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: 30.borderRadiusAll,
                          child: GetBuilder<GetStartedController>(
                            builder: (_) {
                              return Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.asset(controller.getStartedImages[controller.index].image, fit: BoxFit.cover, width: double.infinity),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [AppColors.transparentColor, AppColors.transparentColor, AppColors.blackColor],
                                      ),
                                    ),
                                    child: GetBuilder<GetStartedController>(
                                      builder: (_) {
                                        return AnimatedOpacity(
                                          duration: 500.milSec,
                                          opacity: controller.getStartedImages[controller.index].opacity,
                                          child: Image.asset(controller.getStartedImages[controller.index].image, fit: BoxFit.cover, width: double.infinity),
                                        );
                                      },
                                    ),
                                  ),
                                  AnimatedPositioned(
                                    bottom: controller.getStartedImages[controller.index].position,
                                    duration: 1.5.sec,
                                    child: Text(controller.getStartedImages[controller.index].title, style: TextStyle(color: AppColors.whiteColor, fontSize: 25, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: GetBuilder<GetStartedController>(
                          builder: (_) {
                            return Row(
                              children: [
                                Expanded(child: Image.asset(controller.index == 0 ? AppStrings.selectedIndexImage : AppStrings.unSelectedIndexImage)),
                                Expanded(child: Image.asset(controller.index == 1 ? AppStrings.selectedIndexImage : AppStrings.unSelectedIndexImage)),
                                Expanded(child: Image.asset(controller.index == 2 ? AppStrings.selectedIndexImage : AppStrings.unSelectedIndexImage)),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<GetStartedController>(
                              builder: (_) {
                                return AnimatedSize(
                                  duration: 500.milSec,
                                  child: InkWell(
                                    onTap: controller.decrementIndex,
                                    child: Container(
                                      width: controller.index == 0 ? 0 : (MediaQuery.of(context).size.width - 120) / 2,
                                      padding: 10.edgeInsetsAll,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(borderRadius: 15.borderRadiusAll, border: Border.all(color: AppColors.darkGoldColor, width: 2)),
                                      child: controller.index == 0 ? 0.gap : Text(AppStrings.backText, style: TextStyle(color: AppColors.darkGoldColor, fontWeight: FontWeight.bold, fontSize: 30)),
                                    ),
                                  ),
                                );
                              },
                            ),
                            GetBuilder<GetStartedController>(
                              builder: (_) {
                                return AnimatedSize(duration: 500.milSec, child: controller.index == 0 ? 0.gap : 10.gap);
                              },
                            ),
                            GetBuilder<GetStartedController>(
                              builder: (_) {
                                return InkWell(
                                  onTap: controller.incrementIndex,
                                  child: AnimatedContainer(
                                    duration: 500.milSec,
                                    width: controller.index == 0 ? (MediaQuery.of(context).size.width - 120) : (MediaQuery.of(context).size.width - 120) / 2,
                                    padding: 10.edgeInsetsAll,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: AppColors.darkNbetyColor, borderRadius: 15.borderRadiusAll),
                                    child: Text(AppStrings.nextText, style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 30)),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
