import 'package:fevai_app/registration_screens/account_pin.dart';
import 'package:fevai_app/registration_screens/confirm_account_pin.dart';
import 'package:fevai_app/registration_screens/login.dart';
import 'package:fevai_app/registration_screens/register_screen.dart';
import 'package:fevai_app/registration_screens/verify_identity.dart';
import 'package:fevai_app/registration_screens/verify_phone_number.dart';
import 'package:fevai_app/skip_screens/meet_chat.dart';
import 'package:fevai_app/skip_screens/money.dart';
import 'package:fevai_app/skip_screens/virtual.dart';
import 'package:fevai_app/welcome_pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/onboarding_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(31, 113, 106, 106)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/virtual': (context) => const Virtual(),
        '/money' : (context) => const Money(),
        '/meet_chat': (context) => const MeetChat(),
        '/registration_login': (context) => const Login(),
        '/register': (context) => const RegisterScreen(),
          '/verify_phone_number': (context) => const VerifyPhoneNumber(),
           '/verify_identity': (context) => const VerifyIdentity(),
            '/account_pin': (context) => const AccountPin(),
              '/confirm_account_pin': (context) => const ConfirmAccountPin(),
      },
    );
  }
}
