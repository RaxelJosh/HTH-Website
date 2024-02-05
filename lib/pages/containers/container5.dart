import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:xpense_flutter_web/utils/constants.dart';
import 'package:xpense_flutter_web/widgets/commonContainer.dart';

class Container5 extends StatefulWidget {
  const Container5({Key? key}) : super(key: key);

  @override
  _Container5State createState() => _Container5State();
}

class _Container5State extends State<Container5> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer5(),
      desktop: DesktopContainer5(),
    );
  }

  //================ MOBILE ===============

  Widget MobileContainer5() {
    return CommonContainerMobile(
        'Career',
        'Build your Career With Us',
        'Tellus lacus morbi sagittis lacus in. Amet nisl at mauris enim accumsan nisi, tincidunt vel. Enim ipsum, amet quis ullamcorper eget ut.',
        careers,
        true);
  }

  //============== DESKTOP =============

  Widget DesktopContainer5() {
    return CommonContainer(
        'Career',
        'Build your Career With Us',
        'We are Always trying to find \n'
            'the most caring and qualified professional staff \n'
            'including Registered Nurse, Occupational Therapists, Quality Assurance and Many More.',
        careers,
        true);
  }
}
