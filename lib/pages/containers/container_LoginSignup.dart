import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:HTH_Exp/pages/signUp.dart';

class LoginSignupContainer extends StatefulWidget {
  @override
  _LoginSignupContainerState createState() => _LoginSignupContainerState();
}

class _LoginSignupContainerState extends State<LoginSignupContainer> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return _buildContainer(context, 400); // Desktop view
        } else {
          return _buildContainer(context, double.infinity); // Mobile view
        }
      },
    );
  }

  Widget _buildContainer(BuildContext context, double width) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_image.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // Content
        Align(
          alignment: Alignment.centerLeft,
          child: Transform.translate(
            offset: Offset(300.0, 50.0),
            child: Container(
              width: width,
              height: 500, // Height of the entire container
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 300, // Adjust the height of the inner container as needed
                    child: Container(
                      padding: EdgeInsets.all(20.0), // Adjust padding as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildTextField('Username', _usernameController),
                          SizedBox(height: 20.0),
                          _buildTextField('Password', _passwordController, obscureText: true),
                          SizedBox(height: 20.0),
                          _buildButton('Login', Colors.blue, context),
                          SizedBox(height: 20.0),
                          _buildButton('Sign Up', Colors.green, context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildButton(String text, Color color, BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (text == 'Login') {
          try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _usernameController.text,
              password: _passwordController.text,
            );
            // Login successful
            // Show success pop-up
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: Text('You have successfully logged in.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found' || e.code == 'wrong-password') {
              // Invalid username or password
              // Show an error message to the user
            }
          } catch (e) {
            print(e);
          }
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpForm()), // Assuming SignUpForm is a defined widget
          );
        }
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: Size(150, 40),
      ),
    );
  }
}
