import 'package:fevai_app/welcome_pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
      //  scaffoldBackgroundColor: const Color.fromARGB(31, 74, 70, 70)
      ),
      debugShowCheckedModeBanner: false,
      home:  Welcome()
    );
  }
}
