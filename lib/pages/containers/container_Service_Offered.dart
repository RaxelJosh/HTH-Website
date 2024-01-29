import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceOfferedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileServiceOfferedContainer(),
      desktop: DesktopServiceOfferedContainer(),
    );
  }
}

class MobileServiceOfferedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white, // Customize background color as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Services Offered',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'List of services offered in mobile view.',
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

class DesktopServiceOfferedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white, // Customize background color as needed
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
                  'Services Offered',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'List of services offered in desktop view.',
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
