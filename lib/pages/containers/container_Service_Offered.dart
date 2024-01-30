import 'dart:ui'; // Import the 'ui' library for using the ImageFilter class
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:hovering/hovering.dart'; // Import the hovering package
import 'package:xpense_flutter_web/utils/constants.dart';

class ServiceOfferedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileServiceOfferedContainer(),
      desktop: DesktopServiceOfferedContainer(),
    );
  }
}

class MobileServiceOfferedContainer extends StatelessWidget {
  final List<String> imageAssets = [
    illustration2,
    illustration3,
    nurse,
    careers,
    home
  ];

  final List<String> imageTexts = [
    'Text for Image 1',
    'Text for Image 2',
    'Text for Image 3',
    'Text for Image 4',
    'Text for Image 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white, // Customize background color as needed
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Services Offered',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Gallery for mobile view
            MobileGallery(imageAssets: imageAssets, imageTexts: imageTexts),
          ],
        ),
      ),
    );
  }
}

class DesktopServiceOfferedContainer extends StatelessWidget {
  final List<String> imageUrls = [
    illustration2,
    illustration3,
    nurse,
    careers,
    home
  ];

  final List<String> imageTexts = [
    'Text for Image 1',
    'Text for Image 2',
    'Text for Image 3',
    'Text for Image 4',
    'Text for Image 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white, // Customize background color as needed
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Services Offered',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Gallery for desktop view
            DesktopGallery(imageUrls: imageUrls, imageTexts: imageTexts),
          ],
        ),
      ),
    );
  }
}

class MobileGallery extends StatelessWidget {
  final List<String> imageAssets;
  final List<String> imageTexts;

  const MobileGallery({
    Key? key,
    required this.imageAssets,
    required this.imageTexts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        imageAssets.length,
            (index) => Container(
          margin: EdgeInsets.all(8),
          color: Colors.grey[300],
          child: HoverWidget(
            onHover: (_) {}, // Add an empty onHover callback
            hoverChild: Center(
              child: Text(
                imageTexts[index], // Display corresponding text for the image
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child: Center(
              child: Image.asset(
                imageAssets[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DesktopGallery extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> imageTexts;

  const DesktopGallery({
    Key? key,
    required this.imageUrls,
    required this.imageTexts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        imageUrls.length,
            (index) => Container(
          margin: EdgeInsets.all(8),
          color: Colors.grey[300],
          child: HoverWidget(
            onHover: (_) {}, // Add an empty onHover callback
            hoverChild: Center(
              child: Text(
                imageTexts[index], // Display corresponding text for the image
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child: Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
