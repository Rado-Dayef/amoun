import 'package:amoun/constants/extensions.dart';
import 'package:amoun/controllers/home_controller.dart';
import 'package:amoun/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class ProfileScreen extends GetWidget<HomeController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User info',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Column(
        children: [
          40.gap,
          Text("User Info"),
          Divider(
            color: AppColors.darkGoldColor,
            thickness: 2,
            indent: 160,
            endIndent: 160,
          ),
          20.gap,
          CircleAvatar(
            backgroundColor: AppColors.darkGoldColor,
            radius: 45,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: AppColors.whiteColor, size: 50),
            ),
          ),
          20.gap,
          Text(
            "Name",
            style: TextStyle(color: AppColors.lightGoldColor, fontSize: 20),
          ),
          Text(
            user.name,
            style: TextStyle(
              color: AppColors.darkNbetyColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          20.gap,
          Text(
            "Email",
            style: TextStyle(color: AppColors.lightGoldColor, fontSize: 20),
          ),
          Text(
            user.email,
            style: TextStyle(
              color: AppColors.darkNbetyColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          20.gap,
          Text(
            "Nationality",
            style: TextStyle(color: AppColors.lightGoldColor, fontSize: 20),
          ),
          Text(
            "Egyptian",
            style: TextStyle(
              color: AppColors.darkNbetyColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          20.gap,
          InkWell(
            onTap: () {
              controller.signOut();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.darkNbetyColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Logout",style: TextStyle(
                color: AppColors.darkGoldColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
