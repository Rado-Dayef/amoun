import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:amoun/constants/strings.dart';
import 'package:amoun/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: AppColors.darkNbetyColor, child: Opacity(opacity: 0.3, child: Image.asset(AppStrings.backgroundImage, width: double.infinity, height: double.infinity))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: 0.gap),
              Expanded(
                flex: 0,
                child: Card(
                  elevation: 10,
                  color: AppColors.darkNbetyColor,
                  shape: RoundedRectangleBorder(borderRadius: 30.borderRadiusAll, side: BorderSide(color: AppColors.lightGoldColor, width: 1)),
                  child: Image.asset(AppStrings.logoImage),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.whiteColor, indent: 10, endIndent: 10)),
                    Expanded(flex: 0, child: Image.asset(AppStrings.starImage)),
                    10.gap,
                    Expanded(flex: 0, child: Text(AppStrings.appSubTitle, style: TextStyle(color: AppColors.lightGoldColor, fontSize: 15))),
                    10.gap,
                    Expanded(flex: 0, child: Image.asset(AppStrings.starImage)),
                    Expanded(child: Divider(color: AppColors.whiteColor, indent: 10, endIndent: 10)),
                  ],
                ),
              ),
              Expanded(child: Align(alignment: Alignment.topCenter, child: 60.lightGoldLoading)),
            ],
          ),
        ],
      ),
    );
  }
}
