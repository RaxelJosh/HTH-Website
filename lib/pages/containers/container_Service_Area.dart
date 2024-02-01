import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceAreaContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileAboutUsContainer(),
      desktop: DesktopAboutUsContainer(),
    );
  }
}

class MobileAboutUsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/harrisMap.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust the blur intensity as needed
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.transparent, // Keep the overlay content clear
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Service Area',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'For over half a decade, our commitment has been unwavering in catering to the needs of Houston and its neighboring counties and communities.\n'
                      'Our outreach spans across 200+ ZIP codes in the Houston area, encompassing the diverse landscapes from Central and West to Downtown, North, and South, as well as the Eastern regions.\n'
                      'Our extensive service area ensures that we are accessible and available to serve a broad spectrum of clients throughout these vibrant locales.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                // Add more widgets for mobile view as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DesktopAboutUsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/harrisMap.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust the blur intensity as needed
          child: Container(
            padding: EdgeInsets.all(40),
            color: Colors.transparent, // Keep the overlay content clear
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(), // Empty container to add space on the left
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Service Area',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'For over half a decade, our commitment has been unwavering in catering to the needs of Houston and its neighboring counties and communities.\n'
                            'Our outreach spans across 200+ ZIP codes in the Houston area, encompassing the diverse landscapes from Central and West to Downtown, North, and South, as well as the Eastern regions.\n'
                            'Our extensive service area ensures that we are accessible and available to serve a broad spectrum of clients throughout these vibrant locales.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      // Add more widgets for desktop view as needed
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(), // Empty container to add space on the right
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

