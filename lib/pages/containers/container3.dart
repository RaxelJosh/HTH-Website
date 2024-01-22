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
        'About Us',
        'Real-time \nHome HealthCare \nSupport',
        'We have been providiing quality home health care services in the Houston and surrounding Southesast Texas communities since 2006.  We provide highly skilled, compassionate, reliable Professionals and Care Givers to individuals in need of home health care.illustration1'
        ,illustration1,
        true);
  }

  //============== DESKTOP =============

  Widget DesktopContainer3() {
    return CommonContainer(
        'About Us',
        'Real-time \nHome HealthCare \nSupport',
        'We have been providiing quality home health care services in the Houston and surrounding Southesast Texas communities since 2006.  We provide highly skilled, compassionate, reliable Professionals and Care Givers to individuals in need of home health care.illustration1',
        illustration1,
        true);
  }
}
