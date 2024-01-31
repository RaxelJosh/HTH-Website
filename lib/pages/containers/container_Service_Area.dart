import 'dart:ui'; // Import 'ui' to use ImageFilter

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceAreaContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileServiceAreaContainer(),
      desktop: DesktopServiceAreaContainer(),
    );
  }
}

class MobileServiceAreaContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image with blur effect
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Image.asset(
            'assets/images/harrisMap.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Container(
          padding: EdgeInsets.all(100),
          color: Colors.transparent, // Transparent background color
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Service Area',
                textAlign: TextAlign.center, // Center align text
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Add your mobile-specific service area information here.',
                textAlign: TextAlign.center, // Center align text
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Text color
                ),
              ),
              // Add more widgets for mobile view as needed
            ],
          ),
        ),
      ],
    );
  }
}

class DesktopServiceAreaContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image with blur effect
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Image.asset(
            'assets/images/harrisMap.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Container(
          padding: EdgeInsets.all(100),
          color: Colors.transparent, // Transparent background color
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
                  crossAxisAlignment: CrossAxisAlignment.center, // Center align text horizontally
                  children: [
                    Text(
                      'Harris County Texas',
                      textAlign: TextAlign.center, // Center align text
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'For over half a decade, our commitment has been unwavering in catering to the needs of Houston and its neighboring counties and communities.\n'
                          'Our outreach spans across 200+ ZIP codes in the Houston area, encompassing the diverse landscapes from Central and West to Downtown, North, and South, as well as the Eastern regions.\n'
                          'Our extensive service area ensures that we are accessible and available to serve a broad spectrum of clients throughout these vibrant locales.',
                      textAlign: TextAlign.center, // Center align text
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
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
      ],
    );
  }
}
