import 'package:flutter/material.dart';
import 'package:discod/DiscodeFrontend.dart';

import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class PermissionRequestPage extends StatelessWidget {
  const PermissionRequestPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: PermissionRequestWidget(),
        ),
      ),
    );
  }
}

class PermissionRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 375,
          height: 190,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 382,
                  height: 195,
                  decoration: BoxDecoration(color: const Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 16,
                top: 37,
                child: SizedBox(
                  width: 40,  // Adjust the width for the logo
                  height: 40, // Adjust the height for the logo
                child:  IconButton(
                    icon: Icon(Icons.contact_phone_outlined),
                    color: Colors.blue,
                    onPressed: () {
                      // Implement search functionality
                    },

                  ), // Replace 'assets/contact_logo.png' with your image asset
                ),
              ),
              Positioned(
                left: 100, // Adjust the position as needed
                top: 37,  // Adjust the position as needed
                child: SizedBox(
                  width: 343,
                  height: 81,
                  child: Text(
                    'Allow Discod to access your contacts?',

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 125,
                top: 140,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DicodeFrontend()));  // Handle DENY button click
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF18988B)),
                  ),
                  child: Text(
                    'DENY',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 216,
                top: 140,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DicodeFrontend()));// Handle ALLOW button click
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF18988B)),
                  ),
                  child: Text(
                    'ALLOW',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}