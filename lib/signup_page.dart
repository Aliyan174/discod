import 'package:discod/signup_page2.dart';
import 'package:discod/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DateTime selectedDate = DateTime.now();
  String selectedGender = "Male";
  String age = '';
  File? profileImage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        calculateAge();
      });
    }
  }

  void calculateAge() {
    final now = DateTime.now();
    final difference = now.difference(selectedDate);
    final age = (difference.inDays / 365).floor();
    setState(() {
      this.age = age.toString();
    });
  }

  Future<void> _getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignupPage()));
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
            ListTile(
              title: Text(
                "Gender*",
                style: TextStyle(fontWeight: FontWeight.bold), // Making the heading bold
              ),
              subtitle: Row(
                children: [
                  Radio(
                    value: "Male",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                    activeColor: Colors.red, // Filled color
                  ),
                  Text("Male"),
                  Radio(
                    value: "Female",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                    activeColor: Colors.red, // Filled color
                  ),
                  Text("Female"),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Date of Birth*",
                style: TextStyle(fontWeight: FontWeight.bold), // Making the heading bold
              ),
              onTap: () {
                _selectDate(context);
              },
              subtitle: Text(
                DateFormat('yyyy-MM-dd').format(selectedDate), // Formats the date
                style: TextStyle(fontSize: 18),
              ),
            ),

            ListTile(
              title: Text(
                "Age*",
                style: TextStyle(fontWeight: FontWeight.bold), // Making the heading bold
              ),
              subtitle: Container(
                // Adjust the width as needed for a smaller box
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    age,
                    style: TextStyle(fontSize: 14), // Adjust the font size as needed
                  ),
                ),
              ),
            ),

            ListTile(
              title: Text(
                "Choose Your Pic",
                style: TextStyle(fontWeight: FontWeight.bold), // Making the heading bold
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 130,
                        height: 100, // Adjust the height as needed
                        child: Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: profileImage != null
                                ? Image.file(
                              File(profileImage!.path),
                              fit: BoxFit.cover,
                              width: 100,
                            )
                                : Icon(Icons.add, size: 25),
                          ),
                        ),
                      ),
                      Spacer(), // Added Spacer widget here
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300], // Button color
                          onPrimary: Colors.black, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Rounded corners
                          ),
                          elevation: 0, // No elevation
                        ),
                        onPressed: () {
                          _getImage(ImageSource.gallery);
                        },
                        child: Text("Choose from Gallery"),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300], // Button color
                          onPrimary: Colors.black, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Rounded corners
                          ),
                          elevation: 0, // No elevation
                        ),
                        onPressed: () {
                          _getImage(ImageSource.camera);
                        },
                        child: Text("Upload an Image"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignupPage())); // Handle the left button action
                      },
                      child: Text("Back"),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignupPage2())); // Handle the right button action
                      },
                      child: Text("Next"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
