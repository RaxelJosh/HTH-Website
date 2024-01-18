import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/utils/colors.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/widgets/commonContainer.dart';

class Container6 extends StatefulWidget {
  const Container6({Key? key}) : super(key: key);

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
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          companyLogo(fb),
          companyLogo(google),
          companyLogo(cocacola),
          companyLogo(samsung)
        ],
      ),
    );
  }

  //============== DESKTOP =============

  Widget DesktopContainer6() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          companyLogo(fb),
          companyLogo(google),
          companyLogo(cocacola),
          companyLogo(samsung)
        ],
      ),
    );
  }
  Widget companyLogo(String image) {
      return Container(
        width: 160,
        height: 36,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
        ),
      );
    }
}
