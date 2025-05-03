import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:amoun/controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/strings.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 5,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
             controller.signOut();
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
        title: Text(
          controller.user.name,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              25.gap,
              Text(
                "The most visited  Places",
                style: TextStyle(
                  color: AppColors.darkNbetyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: AppColors.darkGoldColor,
                thickness: 2,
                indent: 115,
                endIndent: 115,
              ),
              25.gap,
              CarouselSlider.builder(
                itemCount: controller.visitedPlaces.length,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  height: 150,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlayCurve: Curves.easeIn,
                ),
                itemBuilder: (_, int index, __) {
                  return Container(
                    width: 420,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.darkNbetyColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(controller.visitedPlaces[index]["image"], fit: BoxFit.fill),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              controller.visitedPlaces[index]["name"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              25.gap,
              Divider(
                color: AppColors.darkGoldColor,
                thickness: 2,
                indent: 115,
                endIndent: 115,
              ),
              45.gap,
              Text(
                "App Services",
                style: TextStyle(
                  color: AppColors.darkNbetyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: AppColors.darkGoldColor,
                thickness: 2,
                indent: 155,
                endIndent: 155,
              ),
              25.gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.darkNbetyColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(AppStrings.translateRoute);
                          },
                          icon: const Icon(Icons.translate, size: 25, color: Colors.white),
                        ),
                      ),
                      10.gap,
                      const Text("Instant translation",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.darkNbetyColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(AppStrings.aiRoute);
                          },
                          icon: const Icon(Icons.camera, size: 25, color: Colors.white),
                        ),
                      ),
                      10.gap,
                      const Text("Artificial Intelligence",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
