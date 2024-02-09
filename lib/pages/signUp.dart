import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart'; // Import crypto package

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Container(
          width: 300.0, // Adjust the width as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildInputField('First Name', _firstNameController),
                      SizedBox(height: 20.0),
                      _buildInputField('Last Name', _lastNameController),
                      SizedBox(height: 20.0),
                      _buildInputField('Email', _emailController,
                          validator: _validateEmail),
                      SizedBox(height: 20.0),
                      _buildInputField('Password', _passwordController,
                          isPassword: true,
                          validator: _validatePassword),
                      SizedBox(height: 20.0),
                      _buildInputField('Confirm Password',
                          _confirmPasswordController,
                          isPassword: true,
                          validator: _validateConfirmPassword),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            // Perform sign-up logic here
                            String email = _emailController.text.trim();
                            String password = _passwordController.text.trim();
                            String firstName = _firstNameController.text.trim();
                            String lastName = _lastNameController.text.trim();

                            try {
                              // Check if email already exists
                              var querySnapshot = await _firestore.collection('users').where('email', isEqualTo: email).get();
                              if(querySnapshot.docs.isNotEmpty) {
                                _showErrorDialog("Sign Up Failed", "The email address is already in use.");
                                return;
                              }

                              // Hash the password using sha256
                              String hashedPassword = sha256.convert(utf8.encode(password)).toString();

                              // Check if hashed password already exists
                              querySnapshot = await _firestore.collection('users').where('password', isEqualTo: hashedPassword).get();
                              if(querySnapshot.docs.isNotEmpty) {
                                _showErrorDialog("Sign Up Failed", "The password is already in use.");
                                return;
                              }

                              // Create user account
                              UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                              // Store additional user information in Firestore
                              await _firestore.collection('users').doc(userCredential.user!.uid).set({
                                'firstName': firstName,
                                'lastName': lastName,
                                'email': email,
                                'password': hashedPassword, // Store the hashed password
                              });

                              // Sign up successful
                              print('Signed up user: ${userCredential.user!.uid}');
                              _showSuccessDialog(context);
                            } on FirebaseAuthException catch (e) {
                              // Sign up failed
                              print('Failed to sign up: $e');
                              if (e.code == 'email-already-in-use') {
                                _showErrorDialog("Sign Up Failed", "The email address is already in use.");
                              } else {
                                _showErrorDialog("Sign Up Failed", e.message ?? 'An error occurred');
                              }
                            } catch (e) {
                              _showErrorDialog("Sign Up Failed", e.toString());
                            }
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('User creation successful.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Navigate back to loginSignup.dart
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
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
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // You can add more advanced email validation if needed
    // For a basic check, you can use a regular expression or a package like email_validator
    // For example:
    // if (!EmailValidator.validate(value)) {
    //   return 'Please enter a valid email';
    // }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Define a regular expression pattern for password complexity
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
    }

    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget _buildInputField(String labelText, TextEditingController controller,
      {bool isPassword = false, String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
            EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
