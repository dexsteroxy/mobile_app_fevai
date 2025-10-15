import 'package:fevai_app/widgets/pattern_meet_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/onboarding_provider.dart';


class MeetChat extends StatefulWidget {
  const MeetChat({super.key});

  @override
  State<MeetChat> createState() => _MeetChatState();
}

class _MeetChatState extends State<MeetChat> {
  @override
  void initState() {
    super.initState();
    // ✅ Mark this as the 3rd screen (index = 2)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final onboarding = Provider.of<OnboardingProvider>(
        context,
        listen: false,
      );
      onboarding.setIndex(2); // Activate 3rd dash
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
        
          const PatternMeetBackground(),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // === Skip text ===
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

                
                  Center(
                    child: Image.asset(
                      "assets/logos.png",
                      height: 25,
                      width: 28,
                    ),
                  ),

                  const SizedBox(height: 30),

                
                  Image.asset(
                    "assets/chat.png",
                    width: screenWidth * 0.67,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 36),

                 
                  Consumer<OnboardingProvider>(
                    builder: (context, onboarding, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDash(onboarding.currentIndex == 0),
                          const SizedBox(width: 6),
                          _buildDash(onboarding.currentIndex == 1),
                          const SizedBox(width: 6),
                          _buildDash(
                            onboarding.currentIndex == 2,
                          ), // ✅ active dash
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      // width: 359,
                      child: const Text(
                        "Meet FEVAI – Your Smart Assistan",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 3,
                    ),
                    child: SizedBox(
                      child: const Text(
                        "Send money, check balances, set savings – all with a chat",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                 
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 40,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                         
                          Navigator.pushReplacementNamed(
                            context,
                            '/registration_login',
                          );
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
                          "Continue",
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
