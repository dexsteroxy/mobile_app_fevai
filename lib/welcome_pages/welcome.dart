import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Finally is working now",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
