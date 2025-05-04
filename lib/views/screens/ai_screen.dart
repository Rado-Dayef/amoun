import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:flutter/material.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          'AI Recognition of Landmarks',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.darkNbetyColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'Start Recognition of Landmarks',
                style: TextStyle(
                  color: AppColors.darkGoldColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          15.gap,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.darkGoldColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text("Scan",style: TextStyle(
              color: AppColors.darkNbetyColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          15.gap,
          Divider(
            color: AppColors.darkGoldColor,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          15.gap,
          Container(
            margin: const EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.darkNbetyColor),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'AI Recognition Result',

                style: TextStyle(
                  color: AppColors.darkNbetyColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }

