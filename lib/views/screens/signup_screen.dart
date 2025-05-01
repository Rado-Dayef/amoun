import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:amoun/constants/strings.dart';
import 'package:amoun/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppStrings.authBackgroundImage, height: MediaQuery.of(context).size.height * 0.8, width: double.infinity, fit: BoxFit.cover),
          Positioned(top: 35, left: 20, child: Icon(Icons.arrow_back_ios, color: AppColors.whiteColor)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.learnMoreAboutTheBestBeautifulPlacesText, style: TextStyle(color: AppColors.whiteColor, fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              25.gap,
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: 10.edgeInsetsAll,
                  decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: 30.borderRadiusTop, border: Border.all(color: AppColors.darkGoldColor, width: 2)),
                  child: Column(
                    children: [
                      GetBuilder<SignUpController>(
                        builder: (_) {
                          return InkWell(
                            // onTap: controller.incrementIndex,
                            child: AnimatedContainer(
                              duration: 500.milSec,
                              width: (MediaQuery.of(context).size.width - 120),
                              padding: 10.edgeInsetsAll,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: AppColors.darkNbetyColor, borderRadius: 15.borderRadiusAll),
                              child: Text(AppStrings.loginInWithEmailText, style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 30)),
                            ),
                          );
                        },
                      ),
                      Row(
                        children: [
                          Expanded(child: Divider(color: AppColors.lightGoldColor, thickness: 1, indent: 15, endIndent: 15)),
                          Text(AppStrings.orText, style: TextStyle(color: AppColors.darkNbetyColor, fontWeight: FontWeight.bold, fontSize: 20)),
                          Expanded(child: Divider(color: AppColors.lightGoldColor, thickness: 1, indent: 15, endIndent: 15)),
                        ],
                      ),
                      10.gap,
                      Text(AppStrings.continueAsText, style: TextStyle(color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.bold)),
                      10.gap,
                      Row(
                        children: [
                          Expanded(child: 0.gap),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: 50.borderRadiusAll, border: Border.all(color: AppColors.blackColor)),
                              child: CircleAvatar(backgroundColor: AppColors.whiteColor),
                            ),
                          ),
                          Expanded(child: CircleAvatar(backgroundColor: AppColors.whiteColor)),
                          Expanded(child: CircleAvatar(backgroundColor: AppColors.whiteColor)),
                          Expanded(child: 0.gap),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
