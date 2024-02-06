import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/constants.dart';

class Container2 extends StatefulWidget {
  const Container2({Key? key}) : super(key: key);

  @override
  _Container2State createState() => _Container2State();
}

class _Container2State extends State<Container2> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer1(),
      desktop: DesktopContainer1(),
    );
  }

  //================ MOBILE ===============

  Widget MobileContainer1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 20),
      child: Column(
        children: [
          Container(
            height: w! / 1.2,
            width: w! / 1.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(home), fit: BoxFit.contain)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Meeting The Needs \nOf Todays Patient \nAt Home',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: w! / 10, fontWeight: FontWeight.bold, height: 1),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'HealthCare Assistant At The Comfort Of Your Home',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  //============== DESKTOP =============

  Widget DesktopContainer1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w! / 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Us'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Quality Healthcare \nSince 2006',
                        style: TextStyle(
                          fontSize: w! / 30,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'We provide: '
                            '\nhighly skilled, compassionate,'
                            '\nreliable Professionals and Care Givers'
                            '\nto individuals in need of home health care Since 2006.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              // Existing image
              Expanded(
                child: Container(
                  height: 530,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(home),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
