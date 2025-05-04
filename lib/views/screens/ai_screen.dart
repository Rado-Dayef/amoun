import 'dart:convert';
import 'dart:io';

import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  bool isLoading = false;
  late Map<String, dynamic> result = {};
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Recognition of Landmarks',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.darkGoldColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child:
                  file == null
                      ? Center(
                        child: Text(
                          'Start Recognition',
                          style: TextStyle(
                            color: AppColors.darkNbetyColor,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: FileImage(file!),
                          fit: BoxFit.cover,
                        ),
                      ),
            ),
            20.gap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedFile = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    setState(() {
                      if (pickedFile != null) {
                        file = File(pickedFile.path);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkGoldColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Use Camera",
                      style: TextStyle(
                        color: AppColors.darkNbetyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedFile = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    setState(() {
                      if (pickedFile != null) {
                        file = File(pickedFile.path);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkGoldColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Upload from Gallery",
                      style: TextStyle(
                        color: AppColors.darkNbetyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.gap,
            Divider(
              color: AppColors.darkGoldColor,
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
            10.gap,
            InkWell(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                result = await uploadImage(file!);
                setState(() {
                  isLoading = false;
                  this.result = result;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.darkGoldColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:
                    isLoading
                        ? CircularProgressIndicator()
                        : Text(
                          "Recognize",
                          style: TextStyle(
                            color: AppColors.darkNbetyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              ),
            ),
            20.gap,
            Divider(
              color: AppColors.darkGoldColor,
              thickness: 2,
              indent: 50,
              endIndent: 50,
            ),
            20.gap,
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.darkNbetyColor),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(
                      color: AppColors.darkGoldColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    result == null || result["name"] == null
                        ? 'No Result'
                        : result["name"],
                    style: TextStyle(
                      color: AppColors.darkNbetyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Description:",
                    style: TextStyle(
                      color: AppColors.darkGoldColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    result == null || result["description"] == null
                        ? 'No Result'
                        : result["description"],
                    style: TextStyle(
                      color: AppColors.darkNbetyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Historical_significance:",
                    style: TextStyle(
                      color: AppColors.darkGoldColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    result == null || result["historical_significance"] == null
                        ? 'No Result'
                        : result["historical_significance"],
                    style: TextStyle(
                      color: AppColors.darkNbetyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Location:",
                    style: TextStyle(
                      color: AppColors.darkGoldColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    result == null || result["location"] == null
                        ? 'No Result'
                        : result["location"],
                    style: TextStyle(
                      color: AppColors.darkNbetyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Period:",
                    style: TextStyle(
                      color: AppColors.darkGoldColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    result == null || result["period"] == null
                        ? 'No Result'
                        : result["period"],
                    style: TextStyle(
                      color: AppColors.darkNbetyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> uploadImage(File imageFile) async {
    const String apiUrl = "https://a6ef-45-240-128-71.ngrok-free.app/predict";

    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add the image file to the request
      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        // Parse the response
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);

        // Extract the knowledge field as a Map
        if (jsonResponse['knowledge'] != null) {
          // Use default values for null fields
          return {
            'description':
                jsonResponse['knowledge']['description'] ??
                'No description available',
            'historical_significance':
                jsonResponse['knowledge']['historical_significance'] ??
                'No historical significance available',
            'location':
                jsonResponse['knowledge']['location'] ??
                'No location available',
            'name': jsonResponse['knowledge']['name'] ?? 'No name available',
            'period':
                jsonResponse['knowledge']['period'] ?? 'No period available',
          };
        } else {
          return {'error': 'No knowledge found'};
        }
      } else {
        return {'error': 'Error: ${response.statusCode}'};
      }
    } catch (e) {
      return {'error': 'Exception: $e'};
    }
  }
}
