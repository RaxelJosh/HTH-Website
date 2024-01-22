import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class Container1 extends StatefulWidget {
  const Container1({Key? key}) : super(key: key);

  @override
  _Container1State createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer2(),
      desktop: DesktopContainer2(),
    );
  }

  Widget MobileContainer2() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primary),
      child: Column(
        children: [
          SizedBox(height: 20), // Add some spacing
          CarouselSlider(
            items: [
              Image.asset('assets/images/clientReview.png', fit: BoxFit.cover),
              Image.asset('assets/images/illustration2.png', fit: BoxFit.cover),
              Image.asset('assets/images/illustration3.png', fit: BoxFit.cover),
              // Add your carousel items here (e.g., AssetImage('image1.jpg'))
            ],
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget DesktopContainer2() {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primary),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // ... (existing code)
                Positioned(
                    top: -20,
                    right: -20,
                    child: Container(
                      height: 320,
                      width: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(vector1), fit: BoxFit.contain),
                      ),
                    )),
                Positioned(
                    bottom: -20,
                    left: -20,
                    child: Container(
                      height: 320,
                      width: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(vector2), fit: BoxFit.contain),
                      ),
                    )),
                // Add the carousel in the desktop layout
                Positioned(
                  top: 30,
                  left: 30,
                  right: 30,
                  child: CarouselSlider(
                    items: [
                      Image.asset(
                          'assets/images/clientReview.png', fit: BoxFit.contain),
                      Image.asset(
                          'assets/images/illustration2.png', fit: BoxFit.contain),
                      Image.asset(
                          'assets/images/illustration3.png', fit: BoxFit.contain),
                      // Add your carousel items here (e.g., AssetImage('image1.jpg'))
                    ],
                    options: CarouselOptions(
                      height: 500.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}