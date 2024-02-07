import 'package:HTH_Exp/pages/containers/container_LoginSignup.dart';
import 'package:HTH_Exp/pages/containers/container_Signup.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


import '../utils/constants.dart';
import '../widgets/navBar.dart';
import 'containers/container6.dart';
import 'containers/container7.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUp createState() => _signUp();
}

class _signUp extends State<signUp> {
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
                          'Sign Up',
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
                SignupForm(),
                Container6(isTrue: false,),
                Container7(),
                // MainContent()
              ],
            ),
          ),
        ));
  }
}
