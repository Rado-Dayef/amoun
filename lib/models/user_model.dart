import 'package:amoun/constants/strings.dart';

class UserModel {
  String email, lastName, firstName;

  UserModel({required this.email, required this.lastName, required this.firstName});

  Map<String, dynamic> asMap() {
    Map<String, dynamic> user = {AppStrings.emailField: email, AppStrings.lastNameField: lastName, AppStrings.firstNameField: firstName};
    return user;
  }

  factory UserModel.asModel(Map<String, dynamic> map) {
    UserModel user = UserModel(email: map[AppStrings.emailField], lastName: map[AppStrings.lastNameField], firstName: map[AppStrings.firstNameField]);
    return user;
  }
}
