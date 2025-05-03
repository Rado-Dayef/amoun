import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:amoun/constants/strings.dart';
import 'package:amoun/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/form_field_widget.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

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
              20.gap,
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
                    key: controller.signUpFormStateKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),

                      child: Column(
                        children: [
                          GetBuilder<SignUpController>(
                            builder: (_) {
                              return InkWell(
                                // onTap: controller.incrementIndex,
                                child: Text(
                                  "Create new account",
                                  style: TextStyle(
                                    color: AppColors.darkNbetyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              );
                            },
                          ),
                          15.gap,
                          FormFieldWidget(
                            textController: controller.nameController,
                            labelName: "Name",
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: AppColors.lightNbetyColor,
                            ),
                            onSaved: (String? value) {
                              controller.name = value!.trim();
                              controller.update();
                            },
                            onChanged: (_) {
                              controller.checkFields();
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.nameField +
                                    AppStrings.spaceSign +
                                    AppStrings.isRequiredValidation;
                              } else if (value.length < 3) {
                                return AppStrings.nameField +
                                    AppStrings.spaceSign +
                                    AppStrings.lessThen4Validation;
                              }
                              return null;
                            },
                          ),
                          15.gap,
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
                          //phone form field
                          GetBuilder<SignUpController>(
                            builder: (context) {
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
                            }
                          ),
                          // sign up button
                          20.gap,
                          GetBuilder<SignUpController>(
                            builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.signUp();
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
                                    AppStrings.signUpText,
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
                        ],
                      ),
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
