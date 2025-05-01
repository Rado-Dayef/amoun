import 'package:amoun/constants/extensions.dart';
import 'package:amoun/constants/strings.dart';
import 'package:amoun/models/services/auth_services.dart';
import 'package:amoun/models/services/firebase_services.dart';
import 'package:amoun/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isSignUpClicked = false;
  String email = AppStrings.emptySign;
  String password = AppStrings.emptySign;
  String lastName = AppStrings.emptySign;
  String firstName = AppStrings.emptySign;
  GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = AppStrings.emptySign;
    password = AppStrings.emptySign;
    lastName = AppStrings.emptySign;
    firstName = AppStrings.emptySign;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isSignUpClicked) {
      signUpFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To sign up.
  Future<void> signUp() async {
    isLoading = true;
    isSignUpClicked = true;
    checkFields();
    if (signUpFormStateKey.currentState!.validate()) {
      signUpFormStateKey.currentState!.save();
      dynamic signUpResponse = await FirebaseAuthService().signUp(email, password);
      if (signUpResponse is User) {
        FirebaseAuthService().signOut();
        UserModel user = UserModel(email: email, lastName: lastName, firstName: firstName);
        dynamic uploadUserResponse = await FirebaseServices.uploadUser(user);
        if (uploadUserResponse is UserModel) {
          Get.offNamed(AppStrings.loginRoute);
        } else {
          uploadUserResponse.toString().showToast;
        }
      } else {
        signUpResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }
}
