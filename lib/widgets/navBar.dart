import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/utils/colors.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/utils/styles.dart';

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
      mobile: MobileNavBar(),
      desktop: DeskTopNavBar(context),
    );
  }
}

Widget MobileNavBar() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Icon(Icons.menu), navLogo()],
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
        navLogo(),
        Row(
          children: [
            navButton('About Us', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()));
            }),
            // navButton('Services Offered'),
            // navButton('Service Area'),
            // navButton('Employment'),
            // navButton('Contact Us')
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

Widget navLogo() {
  return Container(
    width: 300,
    height: 500,
    decoration: BoxDecoration(
        image: DecorationImage( image: AssetImage(logo), fit: BoxFit.cover)
    ),
  );
}
