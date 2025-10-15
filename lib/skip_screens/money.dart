import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/pattern_money_background.dart';

class Money extends StatefulWidget {
  const Money({super.key});

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  @override
  void initState() {
    super.initState();
 
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final onboarding = Provider.of<OnboardingProvider>(context, listen: false);
      onboarding.setIndex(1);
    });
  }

  Widget _buildDash(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 30 : 20,
      height: 5,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFED84C) : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          const PatternMoneyBackground(),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Skip
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<OnboardingProvider>(
                        builder: (context, onboarding, _) => GestureDetector(
                          onTap: onboarding.skip,
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Logo
                  Center(
                    child: Image.asset(
                      "assets/logos.png",
                      height: 25,
                      width: 28,
                    ),
                  ),

                  const SizedBox(height: 0),

                  // Coin artwork (center)
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        "assets/dollar.png",
                        width: screenWidth * 0.95,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 30,
                        right: screenWidth * 0.35,
                        child: Image.asset(
                          "assets/group.png",
                          height: 190,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 0),

                  // Dashes
                  Consumer<OnboardingProvider>(
                    builder: (context, onboarding, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDash(onboarding.currentIndex == 0),
                          const SizedBox(width: 6),
                          _buildDash(onboarding.currentIndex == 1),
                          const SizedBox(width: 6),
                          _buildDash(onboarding.currentIndex == 2),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Title
                  Container(
                    width: 339,
                    child: const Text(
                      "Send & Receive Money Instantly",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Subtitle
                  SizedBox(
                    width: 349,
                    child: const Text(
                      "Transfer funds securely using trusted fintech APIs like Paystack",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Next button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          final onboarding = Provider.of<OnboardingProvider>(context, listen: false);
                          onboarding.nextScreen();
                          Navigator.pushNamed(context, "/meet_chat");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFED84C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 6,
                          shadowColor: Colors.black87,
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
