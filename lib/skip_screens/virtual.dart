import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/pattern_background.dart';

class Virtual extends StatelessWidget {
  const Virtual({super.key});

  @override
  Widget build(BuildContext context) {
    final onboarding = Provider.of<OnboardingProvider>(context);

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
    
      body: Stack(
        children: [
       
          const PatternBackground(),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
           
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () => onboarding.skip(),
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
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

                const SizedBox(height: 60),

                
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
         
                    Image.asset(
                      "assets/debit.png",
                      width: screenWidth * 0.95, 
                      fit: BoxFit.contain,
                    ),

                    Positioned(
                      bottom: 110,
                      right: screenWidth * 0.35,
                      child: Image.asset(
                        "assets/dollar.png",
                        height: 110,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 94),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDash(onboarding.currentIndex == 0),
                    const SizedBox(width: 6),
                    _buildDash(onboarding.currentIndex == 1),
                    const SizedBox(width: 6),
                    _buildDash(onboarding.currentIndex == 2),
                  ],
                ),

                const SizedBox(height: 20),

                
                Container(
                  width: 335,
                  child: const Text(
                    "Your Free Naira Virtual Card",
                    
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

              
                SizedBox(
                  width: 345,
                  child: const Text(
                    "Spend online with ease. Powered by Wallets Africa or Providus",
                
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const Spacer(),

             
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                      
                        Navigator.pushNamed(context, '/money');
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
        ],
      ),
    );
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
}
