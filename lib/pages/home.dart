import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/pages/containers/container1.dart';
import 'package:xpense_flutter_web/pages/containers/container2.dart';
import 'package:xpense_flutter_web/pages/containers/container3.dart';
import 'package:xpense_flutter_web/pages/containers/container4.dart';
import 'package:xpense_flutter_web/pages/containers/container5.dart';
import 'package:xpense_flutter_web/pages/containers/container7.dart';

import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/widgets/navBar.dart';

import 'containers/container6.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      'Holy Trinity HealthCare',
                      style: TextStyle(
                        fontSize: sizingInformation.isMobile ? w! / 15 : w! / 20,
                        fontWeight: FontWeight.bold,
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
            Container3(),
            Container4(),
            Container5(),
            Container6(),
            Container7(),
            // MainContent()
          ],
        ),
      ),
    ));
  }
}
