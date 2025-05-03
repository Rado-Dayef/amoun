import 'package:amoun/constants/extensions.dart';
import 'package:amoun/controllers/login_controller.dart';
import 'package:amoun/views/widgets/form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppStrings.authBackgroundImage,
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 35,
            left: 20,
            child: Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.learnMoreAboutTheBestBeautifulPlacesText,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              25.gap,
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: 10.edgeInsetsAll,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: 30.borderRadiusTop,
                    border: Border.all(
                      color: AppColors.darkGoldColor,
                      width: 2,
                    ),
                  ),
                  child: Form(
                    key: controller.loginFormStateKey,
                    child: Column(
                      children: [
                        GetBuilder<LoginController>(
                          builder: (_) {
                            return InkWell(
                              // onTap: controller.incrementIndex,
                              child: Text(
                                AppStrings.loginInWithEmailText,
                                style: TextStyle(
                                  color: AppColors.darkNbetyColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            );
                          },
                        ),
                        25.gap,
                        FormFieldWidget(
                          textController: controller.emailController,
                          labelName: AppStrings.emailText,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.lightNbetyColor,
                          ),
                          onSaved: (String? value) {
                            controller.email = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.emailText +
                                  AppStrings.spaceSign +
                                  AppStrings.isRequiredValidation;
                            } else if (!RegExp(r"^[^@.]$").hasMatch(value[0]) ||
                                !RegExp(
                                  r"^[^@.]$",
                                ).hasMatch(value[value.length - 1]) ||
                                RegExp(r'[^\w@.]').hasMatch(value)) {
                              return AppStrings.invalidEmailValidation;
                            } else if (!value.contains(AppStrings.atSign)) {
                              return AppStrings.emailDoesNotContainAtValidation;
                            }
                            return null;
                          },
                        ),
                        15.gap,
                        GetBuilder<LoginController>(
                          builder: (_) {
                            return FormFieldWidget(
                              labelName: AppStrings.passwordText,
                              obscure: controller.obscure,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.darkNbetyColor,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.obscure = !controller.obscure;
                                  controller.update();
                                },
                                child: Icon(
                                  controller.obscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.darkNbetyColor,
                                ),
                              ),
                              onSaved: (String? value) {
                                controller.password = value!.trim();
                                controller.update();
                              },
                              onChanged: (_) {
                                controller.checkFields();
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.passwordText +
                                      AppStrings.spaceSign +
                                      AppStrings.isRequiredValidation;
                                } else if (value.length < 8) {
                                  return AppStrings.passwordText +
                                      AppStrings.spaceSign +
                                      AppStrings.lessThen8Validation;
                                } else if (value.length > 24) {
                                  return AppStrings.passwordText +
                                      AppStrings.spaceSign +
                                      AppStrings.largerThen24Validation;
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        15.gap,
                        GetBuilder<LoginController>(
                          builder: (_) {
                            return InkWell(
                              onTap: () {
                                controller.login();
                              },
                              child: AnimatedContainer(
                                duration: 500.milSec,
                                width: (MediaQuery.of(context).size.width - 120),
                                padding: 10.edgeInsetsAll,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.darkNbetyColor,
                                  borderRadius: 15.borderRadiusAll,
                                ),
                                child:
                                    controller.isLoading
                                        ? const CircularProgressIndicator(
                                          color: AppColors.whiteColor,
                                        )
                                        : Text(
                                          AppStrings.loginText,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                        ),
                              ),
                            );
                          },
                        ),
                        15.gap,
                        //dont have an account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You don't have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GetBuilder<LoginController>(
                              builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    Get.offNamed(AppStrings.signupRoute);
                                  },
                                  child: Text(
                                    " SignUp",
                                    style: TextStyle(
                                      color: AppColors.darkNbetyColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        /*Row(
                          children: [
                            Expanded(child: Divider(color: AppColors.lightGoldColor, thickness: 1, indent: 15, endIndent: 15)),
                            Text(AppStrings.orText, style: TextStyle(color: AppColors.darkNbetyColor, fontWeight: FontWeight.bold, fontSize: 20)),
                            Expanded(child: Divider(color: AppColors.lightGoldColor, thickness: 1, indent: 15, endIndent: 15)),
                          ],
                        ),*/
                        10.gap,
                        //Text(AppStrings.continueAsText, style: TextStyle(color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.bold)),
                        10.gap,
                        /*Row(
                          children: [
                            Expanded(child: 0.gap),
                            */
                        /*Expanded(
                              child: Container(
                                decoration: BoxDecoration(borderRadius: 50.borderRadiusAll, border: Border.all(color: AppColors.blackColor)),
                                child: CircleAvatar(backgroundColor: AppColors.whiteColor),
                              ),
                            ),*/
                        /*
                            //Expanded(child: CircleAvatar(backgroundColor: AppColors.whiteColor)),
                            //Expanded(child: CircleAvatar(backgroundColor: AppColors.whiteColor)),
                            Expanded(child: 0.gap),
                          ],
                        ),*/
                      ],
                    ),
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
