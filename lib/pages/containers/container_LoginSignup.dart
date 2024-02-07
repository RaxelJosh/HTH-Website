import 'package:HTH_Exp/pages/signUp.dart';
import 'package:flutter/material.dart';
class LoginSignupContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // For desktop view
          return _buildDesktopContainer(context); // Pass context
        } else {
          // For mobile view
          return _buildMobileContainer(context); // Pass context
        }
      },
    );
  }

  Widget _buildDesktopContainer(BuildContext context) { // Accept context as a parameter
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Make oblong
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Make oblong
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Login logic
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40), // Adjust button size
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to SignUp screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpForm()), // Assuming SignUp is the name of your screen/widget
                );
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40), // Adjust button size
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileContainer(BuildContext context) { // Accept context as a parameter
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Make oblong
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Make oblong
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Login logic
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40), // Adjust button size
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to SignUp screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpForm()), // Assuming SignUp is the name of your screen/widget
                );
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: Size(150, 40), // Adjust button size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
