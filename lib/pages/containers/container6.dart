import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/constants.dart';

class Container6 extends StatefulWidget {
  final bool isTrue;

  const Container6({Key? key, required this.isTrue}) : super(key: key);

  @override
  _Container6State createState() => _Container6State();
}

class _Container6State extends State<Container6> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer6(),
      desktop: DesktopContainer6(),
    );
  }

  //================ MOBILE ===============

  Widget MobileContainer6() {
    return Container(
      width: double.infinity,
      color: widget.isTrue ? Colors.white30 : Colors.white,
      // Change background color based on isTrue
      padding: EdgeInsets.symmetric(vertical: 0),
      // Remove vertical padding
      child: Column(
        children: [
          buildCompanyLogoSet('Insurance Partnered With:', [
            companyLogo(humana, width: 150, height: 100),
            companyLogo(medicare, width: 150, height: 100),
            companyLogo(wellcare, width: 150, height: 100),
          ]),
          buildCompanyLogoSet('', [
            companyLogo(villageMedical, width: 200, height: 170),
          ]),
          buildCompanyLogoSet('', [
            companyLogo(devoted, width: 150, height: 150),
            companyLogo(genesis, width: 150, height: 30),
            companyLogo(kelsey, width: 150, height: 25),
          ]),
        ],
      ),
    );
  }

//================ Desktop ===============

  Widget DesktopContainer6() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/insurancebanner.jpg'),
          // Adjust the image path as per your project
          fit: BoxFit.cover,
        ),
        color: widget.isTrue ? Colors.blueGrey : Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          buildCompanyLogoSet('Insurance Partnered With:', [
            companyLogo(chs, width: 200, height: 90),
            companyLogo(villageMedical, width: 200, height: 170),
            companyLogo(wellcare, width: 200, height: 90),
            companyLogo(medicare, width: 200, height: 170),
          ]),
          SizedBox(height: 2),
          buildCompanyLogoSet('', [
            companyLogo(kelsey, width: 200, height: 200),
            companyLogo(devoted, width: 200, height: 200),
            companyLogo(genesis, width: 200, height: 40),
            companyLogo(humana, width: 200, height: 200),
          ]),
        ],
      ),
    );
  }
}


  Widget buildCompanyLogoSet(String title, List<Widget> logos) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ), // Add spacing between text and logos
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: logos,
        ),
      ],
    );
  }

  Widget companyLogo(String image, {double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }