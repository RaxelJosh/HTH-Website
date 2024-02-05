import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/pages/Contact_Us.dart';
import 'package:xpense_flutter_web/pages/Employment.dart';
import 'package:xpense_flutter_web/pages/Service_Area.dart';
import 'package:xpense_flutter_web/pages/Services_Offered.dart';
import 'package:xpense_flutter_web/utils/constants.dart';

import '../pages/About_Us.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileNavBar(context),
      desktop: DeskTopNavBar(context),
    );
  }
}

Widget MobileNavBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the home screen or perform any other action
            Navigator.pushReplacementNamed(context, '/'); // Replace '/' with the route of your home screen
          },
          child: Container(
            width: 100, // Adjust the width as needed
            height: 50, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover),
            ),
          ),
        ),
        // Other components/icons for your mobile navbar can be added here
      ],
    ),
  );
}

Widget DeskTopNavBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        navLogo(context),
        Row(
          children: [
            navButton('About Us', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()));
            }),
            navButton('Service Offered', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServicesOfferedPage()));
            }),
            navButton('Service Area', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServiceAreaPage()));
            }),
            navButton('Career', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmploymentPage()));
            }),
            navButton('Contact Us', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()));
            }),
          ],
        ),
      ],
    ),
  );
}

Widget navButton(String text, VoidCallback onPressed) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    child: TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.black, fontSize: 18)),
    ),
  );
}

Widget navLogo(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigate to the home screen or perform any other action
      Navigator.pushReplacementNamed(context, '/'); // Replace '/' with the route of your home screen
    },
    child: Container(
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover),
      ),
    ),
  );
}
