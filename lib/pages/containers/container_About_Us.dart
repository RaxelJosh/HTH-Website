import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutUsContainer extends StatelessWidget {
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
          image: AssetImage('assets/background_image.jpg'), // Replace 'assets/background_image.jpg' with your image asset
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken), // Adjust opacity here
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Us',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Add your mobile-specific content here.',
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

class DesktopAboutUsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.png'), // Replace 'assets/background_image.jpg' with your image asset
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.blueGrey.withOpacity(1.0), BlendMode.darken), // Adjust opacity here
        ),
      ),
      padding: EdgeInsets.all(40),
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
                  'Health Care At Home',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Holy Trinity Healthcare, where Quality, Care, and Compassion converge in the comfort of your home. Since 2006, '
                      'we have been dedicated to providing exceptional healthcare services that prioritize your well-being and convenience At Holy Trinity Healthcare, we understand the importance of feeling supported and cared for in your own space. '
                      'That is why our team is committed to delivering top-notch healthcare that not only meets but exceeds your expectations. '
                      'Whether you are in need of medical assistance, nursing care, or rehabilitation services, together with our Medical Insurance Partner we are here to ensure your journey to wellness is as smooth and comfortable as possible.',
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
    );
  }
}
