import 'package:flutter/material.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          'Scanning and Instant Translation',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Center(child: const Text('This is the Translate Screen')),
    );
  }
}
