import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/utils/colors.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/widgets/commonContainer.dart';

class Container3 extends StatefulWidget {
  const Container3({Key? key}) : super(key: key);

  @override
  _Container3State createState() => _Container3State();
}

class _Container3State extends State<Container3> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer3(),
      desktop: DesktopContainer3(),
    );
  }

  //================ MOBILE ===============

  Widget MobileContainer3() {
    return CommonContainerMobile(
        'Service Offered',
        'Providing The BEST \nHealthCare \nSupport',
        'We have been PROVIDING QUALITY HOME HEALTHCARE \n'
            'services in the Houston and surrounding SouthEast Texas. \n '
            'Providing SKILLED NURSES \n'
            'for MEDICAL AND PHYSICAL CARE \n'
            'support or even MEDICATION Assistance and Support',
        illustration1,
        true);
  }

  //============== DESKTOP =============

  Widget DesktopContainer3() {
    return CommonContainer(
        'Service Offered',
        'Providing The BEST \nHealthCare \nSupport',
        'We have been PROVIDING QUALITY HOME HEALTHCARE \n'
            'services in the Houston and surrounding SouthEast Texas. \n '
            'Providing SKILLED NURSES \n'
            'for MEDICAL AND PHYSICAL CARE \n'
            'support or even MEDICATION Assistance and Support',
        illustration1,
        true);
  }
}
