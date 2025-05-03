import 'package:amoun/constants/strings.dart';

class UserModel {
  String email, name;

  UserModel({required this.email, required this.name});

  Map<String, dynamic> asMap() {
    Map<String, dynamic> user = {AppStrings.emailField: email, AppStrings.nameField: name};
    return user;
  }

  factory UserModel.asModel(Map<String, dynamic> map) {
    UserModel user = UserModel(email: map[AppStrings.emailField], name: map[AppStrings.nameField]);
    return user;
  }
}
