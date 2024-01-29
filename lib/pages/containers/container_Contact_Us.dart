import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactUsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContactUsContainer(),
      desktop: DesktopContactUsContainer(),
    );
  }
}

class MobileContactUsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white, // Set your desired background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Add your mobile-specific contact information here.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          // Add more widgets for mobile view as needed
        ],
      ),
    );
  }
}

class DesktopContactUsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white, // Set your desired background color
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
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Add your desktop-specific contact information here.',
                  style: TextStyle(
                    fontSize: 18,
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
    );
  }
}
