import 'package:discord/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactPermissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _showPermissionDialog(context); // Show the permission dialog on screen load
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(), // No content in the body, since the dialog will be shown
      ),
    );
  }

  Future<void> _showPermissionDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Make the dialog transparent
          content: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.contacts,
                        size: 30.0,
                        color: Colors.black, // Change icon color as needed
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Allow access to phone contacts?',
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        var status = await Permission.contacts.request();
                        Navigator.of(context).pop(MaterialPageRoute(builder: (_) => DashboardScreen()));
                      },
                      child: Text('Allow'),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(builder: (_) => DashboardScreen()));
                       // Handle the deny action here if needed
                      },
                      child: Text('Deny'),
                    ),
                    SizedBox(width: 20.0),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
