import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Container7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileContainer7(),
      desktop: DesktopContainer7(),
    );
  }
}

class MobileContainer7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(''), // Adjust path as needed
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10), // Adjust height as needed
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Contact Info & Copyright',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Your contact information and copyright details here...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10), // Adjust height as needed
        ],
      ),
    );
  }
}

class DesktopContainer7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/footerbanner.jpg'), // Adjust path as needed
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10), // Adjust height as needed
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '© HTH Holy Trinity Healthcare',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              'Holy Trinity Healthcare\n'
                  '11104 W.Airport BLVD. Suite 131 Stafford, TX 77477\n'
                  'Tel: 713-333-3660\n'
                  'Fax: 713-333-4660\n'
                  'Email: info@hthhealthcare.com',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10), // Adjust height as needed
        ],
      ),
    );
  }
}
