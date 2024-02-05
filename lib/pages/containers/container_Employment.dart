import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EmploymentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileEmploymentContainer(),
      desktop: DesktopEmploymentContainer(),
    );
  }
}

class MobileEmploymentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white, // Set your desired background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Employment',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Add your mobile-specific employment information here.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20), // Add spacing between text and boxes
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ThreeBoxesRow(),
            ),
          ), // Center the row of boxes with SingleChildScrollView
        ],
      ),
    );
  }
}

class DesktopEmploymentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white, // Set your desired background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(), // Empty container to add space on the left
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Employment',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Add your desktop-specific employment information here.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20), // Add spacing between text and boxes
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ThreeBoxesRow(),
                  ),
                ), // Center the row of boxes with SingleChildScrollView
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(), // Empty container to add space on the right
          ),
        ],
      ),
    );
  }
}

class ThreeBoxesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the row
      children: [
        SizedBox(width: 20), // Add initial spacing
        BoxWithImage(
          imagePath: 'assets/images/nurse_career.jpeg',
          caption: 'Registered Nurse',
          additionalText: 'Calling all compassionate RNs! Join our healing squad and ignite positive change in healthcare..',
        ),
        SizedBox(width: 20), // Add spacing between boxes
        BoxWithImage(
          imagePath: 'assets/images/therapist_career.jpg',
          caption: 'Occupational Therapies',
          additionalText: 'Empower lives and shape futures! Join our Occupational Therapies dream team today.',
        ),
        SizedBox(width: 20), // Add spacing between boxes
        BoxWithImage(
          imagePath: 'assets/images/bi_career.jpg',
          caption: 'Back office and Staffs',
          additionalText: 'Unlock your potential and thrive in our back office family! Join us and be part of something amazing.',
        ),
        SizedBox(width: 20), // Add final spacing
      ],
    );
  }
}


class BoxWithImage extends StatefulWidget {
  final String imagePath;
  final String caption;
  final String additionalText;

  const BoxWithImage({
    required this.imagePath,
    required this.caption,
    required this.additionalText,
  });

  @override
  _BoxWithImageState createState() => _BoxWithImageState();
}

class _BoxWithImageState extends State<BoxWithImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 350,
        height: 600,
        transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isHovered ? Colors.blue : Colors.black,
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/career_banner.jpg'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      widget.caption,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing between caption and additional text
                  Text(
                    widget.additionalText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





void main() {
  runApp(MaterialApp(
    home: EmploymentContainer(),
  ));
}
