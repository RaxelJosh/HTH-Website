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
    final double standardImageWidth = 300; // Set the standard width for images
    final double standardImageHeight = 200; // Set the standard height for images

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(banner),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20), // Add some spacing
          Padding(
            padding: EdgeInsets.only(left: 5), // Adjust the padding for horizontal position
            child: Align(
              alignment: Alignment.centerLeft, // Align carousel to the left
              child: CarouselSlider(
                items: [
                  Container(
                    width: standardImageWidth,
                    height: standardImageHeight,
                    child: Image.asset(
                      'assets/images/clientReview.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: standardImageWidth,
                    height: standardImageHeight,
                    child: Image.asset(
                      'assets/images/illustration2.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: standardImageWidth,
                    height: standardImageHeight,
                    child: Image.asset(
                      'assets/images/illustration3.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: standardImageHeight,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: standardImageWidth / standardImageHeight,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget DesktopContainer2() {
    final double standardImageWidth = 750; // Set the standard width for images
    final double standardImageHeight = 500; // Set the standard height for images

    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(banner),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 5,
            child: Container(
              padding: EdgeInsets.only(left: 20), // Adjust left padding here
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        width: standardImageWidth,
                        height: standardImageHeight,
                        child: Image.asset(
                          'assets/images/clientReview.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: standardImageWidth,
                        height: standardImageHeight,
                        child: Image.asset(
                          'assets/images/illustration2.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: standardImageWidth,
                        height: standardImageHeight,
                        child: Image.asset(
                          'assets/images/illustration3.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: standardImageHeight,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: standardImageWidth / standardImageHeight,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}