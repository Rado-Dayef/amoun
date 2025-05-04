import 'dart:convert';
import 'dart:io';

import 'package:amoun/constants/colors.dart';
import 'package:amoun/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  bool isLoading = false;
  String result = "";
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scanning and Instant Translation',
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
                          'Start Translation',
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
                String result = await uploadImage(file!);
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
                          "Translate",
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
                  result == "" ? 'Translation Result' : result,
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
      ),
    );
  }
  Future<String> uploadImage(File imageFile) async {
    const String apiUrl = "https://0672-45-240-128-71.ngrok-free.app/predict";

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

        // Access the transliteration field from the first result
        if (jsonResponse['results'] != null && jsonResponse['results'].isNotEmpty) {
          return jsonResponse['results'][0]['transliteration'];
        } else {
          return "No transliteration found";
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Exception: $e";
    }
  }
}
