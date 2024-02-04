import 'package:flutter/material.dart';

import '../widgets/button1.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                ),
                child: Image.asset(
                  'assets/images/1.jpg', // Replace with your image path
                  fit: BoxFit
                      .fill, // Ensure the image fills the space without distortion
                ),
              ),
            ),
          ),
          const SizedBox(height: 27.0),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center, // Align the text center horizontally
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign:
                        TextAlign.center, // Align text within RichText center
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                        height: 2.2,
                        letterSpacing: 0.2,
                        color: Color(0xffffffff),
                        // You can set your desired text color here
                      ),
                      children: [
                        TextSpan(
                          text: 'Welcome to ',
                        ),
                        TextSpan(
                          text: 'SmallBizHub',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                            color:
                                Color(0xFF53B0A2), // 'SmallBizHub' text color
                          ),
                        ),
                        TextSpan(text: ',\n'),
                        TextSpan(
                          text: 'Where small businesses thrive! \n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: 'Discover unique products and support \n'),
                        TextSpan(
                            text: 'local entrepreneurs while enjoying a \n'),
                        TextSpan(text: 'seamless and enjoyable shopping\n'),
                        TextSpan(text: 'journey.\n'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 45.0),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, // Updated alignment
                    children: [
                      CustomButton(
                        text: 'Skip',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/continueAs');
                          // Left button action
                        },
                      ),
                      const SizedBox(
                          width: 20), // Adjust the space between buttons
                      CustomButton(
                        text: 'Next',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/onboarding2');
                          // Right button action
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Added space between buttons and ellipsis
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 1.0,
                        child: SizedBox(
                          width: 8,
                          height: 8,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF53B0A2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Opacity(
                        opacity: 0.5,
                        child: SizedBox(
                          width: 8,
                          height: 8,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF53B0A2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Opacity(
                        opacity: 0.5,
                        child: SizedBox(
                          width: 8,
                          height: 8,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF53B0A2),
                            ),
                          ),
                        ),
                      ),
                    ],
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
