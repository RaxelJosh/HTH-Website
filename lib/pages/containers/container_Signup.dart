import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _firstName = '';
  String _lastName = '';
  String _birthday = '';
  String _email = '';
  String _password = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // Firebase signup successful, do further processing if needed
        print('Signup successful for ${userCredential.user!.email}');
      } on FirebaseAuthException catch (e) {
        print('Firebase signup error: $e');
        // Handle signup errors
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'First Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name.';
              }
              return null;
            },
            onSaved: (value) {
              _firstName = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name.';
              }
              return null;
            },
            onSaved: (value) {
              _lastName = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Birthday'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your birthday.';
              }
              return null;
            },
            onSaved: (value) {
              _birthday = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password.';
              }
              return null;
            },
            onSaved: (value) {
              _password = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty || value != _passwordController.text) {
                return 'Passwords do not match.';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
