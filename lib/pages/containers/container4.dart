import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/utils/colors.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/widgets/commonContainer.dart';

class Container4 extends StatefulWidget {
  const Container4({Key? key}) : super(key: key);

  @override
  _Container4State createState() => _Container4State();
}

class _Container4State extends State<Container4> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer4(),
      desktop: DesktopContainer4(),
    );
  }

  //================ MOBILE ===============

  Widget MobileContainer4() {
    color: Colors.cyanAccent;
    return CommonContainerMobile(
        'Services Offered',
        'HealthCare Comfort \nDelivered \nAt Your Home',
        'Our Team of Professionals are specially \ntrained and experienced in providing Medical Services, Medication Services,'
            'Post Operative Care, Venipuncture, Wound Care, Comprehensive Rehabilitative Care and many more.',
        illustration2,
        false);
  }

  //============== DESKTOP =============

  Widget DesktopContainer4() {
    return CommonContainer(
        'Services Offered',
        'HealthCare Comfort \nDelivered \nAt Your Home',
        'Our Team of Professionals are specially trained and experienced in providing Medical Services, Medication Services,'
            'Post Operative Care, Venipuncture, Wound Care, Comprehensive Rehabilitative Care and many more.',
        illustration2,
        false);
  }
}
