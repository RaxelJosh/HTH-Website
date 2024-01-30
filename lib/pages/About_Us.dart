// about_us.dart

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/pages/containers/container2.dart';
import 'package:xpense_flutter_web/pages/containers/container7.dart';
import 'package:xpense_flutter_web/pages/containers/container_About_Us.dart';

import '../utils/constants.dart';
import '../widgets/navBar.dart';
import 'containers/container1.dart';
import 'containers/container6.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                NavBar(),
                SizedBox(
                  height: 5,
                ),
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: sizingInformation.isMobile ? w! / 15 : w! / 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'assets/fonts/GT Sectra Fine Medium.ttf',
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                // ResponsiveBuilder for 'Meeting The Needs Of Todays Patient At Home' text
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Meeting The Needs Of Todays Patient At Home',
                          style: TextStyle(
                            fontSize: sizingInformation.isMobile ? w! / 60 : w! / 40,
                            fontWeight: FontWeight.w100,
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Container1(),
                Container2(),
                AboutUsContainer(),
                Container6(isTrue: false,),
                Container7(),
                // MainContent()
              ],
            ),
          ),
        ));
  }
}
