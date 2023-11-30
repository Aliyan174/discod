import 'package:discod/signup_page.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                    ),
                    Spacer(),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 25),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildTextFieldWithLabel("First Name", "Write your first Name", firstNameController),
                    SizedBox(height: 10.0),
                    _buildTextFieldWithLabel("Last Name", "Write your last name", lastNameController),
                    SizedBox(height: 10.0),
                    _buildTextFieldWithLabel("Mobile number or email address", "+92********** or abc@xyz.com", emailController),
                    SizedBox(height: 10.0),
                    _buildPasswordFieldWithLabel("Password", "Password", passwordController),
                    SizedBox(height: 10.0),
                    _buildPasswordFieldWithLabel("Confirm Password", "Confirm your password", confirmPasswordController),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              // Form is valid, handle Save action
                              _showSuccessSnackBar(context, "Data saved successfully!");
                            } else {
                              _showErrorSnackBar(context, "Please fill in all required fields.");
                            }
                          },
                          child: Text("Save"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignUpPage()));
                            } else {
                              _showErrorSnackBar(context, "Please fill in all required fields.");
                            }
                          },
                          child: Text("Next"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String labelText, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 8.0), // Adjust the padding between label and field
        Container(
          width: 400.0, // Adjust the width as needed
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0), // Adjusted the border radius
            color: Colors.grey[200],
          ),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildPasswordFieldWithLabel(String labelText, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: 8.0), // Adjust the padding between label and field
        Container(
          width: 400.0, // Adjust the width as needed
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0), // Adjusted the border radius
            color: Colors.grey[200],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: true, // Make it a password field
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
