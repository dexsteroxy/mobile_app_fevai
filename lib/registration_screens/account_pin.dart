import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AccountPin extends StatefulWidget {
  const AccountPin({super.key});

  @override
  State<AccountPin> createState() => _AccountPinState();
}

class _AccountPinState extends State<AccountPin> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final baseDecoration = BoxDecoration(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey),
    );

    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width / 5.5, // <— dynamic sizing
      height: 70, // taller boxes
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: baseDecoration,
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: baseDecoration.copyWith(
        border: Border.all(color: const Color(0xFFFFD700), width: 1.5),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: baseDecoration.copyWith(
        border: Border.all(color: Colors.grey.shade700),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Logo
              Image.asset('assets/logos.png', height: 50),
              const SizedBox(height: 20),

              // Title
              const Text(
                "Secure Your Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "Set Up a 4-digit PIN for transactions",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 40),

              // Label
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the 4-digit Code",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),

              // PIN Input
              Pinput(
                controller: _otpController,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                keyboardType: TextInputType.number,
                showCursor: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onCompleted: (pin) => debugPrint('Entered PIN: $pin'),
              ),

              SizedBox(height: 100),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the 4-digit Code",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              SizedBox(height: 12),
              Pinput(
                controller: _otpController,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                keyboardType: TextInputType.number,
                showCursor: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onCompleted: (pin) => debugPrint('Entered PIN: $pin'),
              ),

              const Spacer(),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('PIN: ${_otpController.text}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
