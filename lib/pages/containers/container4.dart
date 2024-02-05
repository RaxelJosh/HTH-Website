import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
    return CommonContainerMobile(
        'Service Area',
        'HealthCare Comfort \nDelivered \nAt Your Home',
        ' For 18 YEARS we Provided Quality HealthCare, \n'
            'Covering 200 Zip Codes from all over Houston Texas.',
        texas1,
        false);
  }

  //============== DESKTOP =============

  Widget DesktopContainer4() {
    return CommonContainer(
        'Service Area',
        'HealthCare Comfort \nDelivered \nAt Your Home',
        ' For 18 YEARS we Provided Quality HealthCare, \n'
            'Covering 200 Zip Codes from all over Houston Texas.',
        texas1,
        false);
  }
}
