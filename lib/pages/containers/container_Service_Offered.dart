import 'dart:ui'; // Import the 'ui' library for using the ImageFilter class
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
    'assets/images/catheter.jpeg',
    'assets/images/enteral.jpg',
    'assets/images/medication.jpg',
    'assets/images/ostomy.jpg',
    'assets/images/painManagement.jpg',
    'assets/images/physical.jpg',
    'assets/images/venipuncture.jpg',
    'assets/images/wound.jpg',

  ];

  final List<String> imageTexts = [
    'CATHETER CARE',
    'ENTERAL TUBE FEEDING',
    'MEDICATION MANAGEMENT',
    'OSTOMY CARE',
    'PAIN MANAGEMENT',
    'PHYSICAL THERAPY',
    'VENIPUNCTURE CARE',
    'WOUND CARE',

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
    'assets/images/catheter.jpeg',
    'assets/images/enteral.jpg',
    'assets/images/medication.jpg',
    'assets/images/ostomy.jpg',
    'assets/images/painManagement.jpg',
    'assets/images/physical.jpg',
    'assets/images/venipuncture.jpg',
    'assets/images/wound.jpg',
  ];

  final List<String> imageTexts = [
    'CATHETER CARE',
    'ENTERAL TUBE FEEDING',
    'MEDICATION MANAGEMENT',
    'OSTOMY CARE',
    'PAIN MANAGEMENT',
    'PHYSICAL THERAPY',
    'VENIPUNCTURE CARE',
    'WOUND CARE',
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
          child: HoverImage(
            image: Image.asset(
              imageAssets[index],
              fit: BoxFit.cover,
            ),
            hoverText: imageTexts[index],
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
          child: HoverImage(
            image: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
            ),
            hoverText: imageTexts[index],
          ),
        ),
      ),
    );
  }
}

class HoverImage extends StatefulWidget {
  final Image image;
  final String hoverText;

  const HoverImage({
    Key? key,
    required this.image,
    required this.hoverText,
  }) : super(key: key);

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget.image,
          _buildBlurOverlay(_isHovered),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isHovered ? 1.0 : 0.0,
              child: Text(
                widget.hoverText,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurOverlay(bool isHovered) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: isHovered ? 1.0 : 0.0,
      child: ClipRect(
        child: BackdropFilter(
          filter: isHovered ? ImageFilter.blur(sigmaX: 9, sigmaY: 9) : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
