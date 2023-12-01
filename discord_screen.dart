import 'package:flutter/material.dart';
import 'walkthrough_screen.dart'; // Import your actual walkthrough screen here

class DiscordScreen extends StatefulWidget {
  @override
  _DiscordScreenState createState() => _DiscordScreenState();
}

class _DiscordScreenState extends State<DiscordScreen> {
  double logoOpacity = 0.0;
  double textOpacity = 0.0;
  double slideValue = -100.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        logoOpacity = 1.0;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        textOpacity = 1.0;
        slideValue = 0.0;
      });
      // Navigate to the walkthrough screen after animations
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WalkthroughScreen(), // Replace with your walkthrough screen widget
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Discord logo on the left, slightly smaller
            Padding(
              padding: EdgeInsets.all(20.0),
              child: AnimatedOpacity(
                opacity: logoOpacity,
                duration: Duration(seconds: 1),
                child: Image.asset(
                  'assets/discod.jpg', // Replace with the actual path to your Discord logo image
                  width: 100.0, // Adjust the size as needed
                ),
              ),
            ),

            // Text with gradient colors and slide transition
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(slideValue, 0.0),
                end: Offset(0.0, 0.0),
              ).animate(
                CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Curves.easeOut,
                ),
              ),
              child: AnimatedOpacity(
                opacity: textOpacity,
                duration: Duration(seconds: 1),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Color(0xFF33C295), Colors.white], // Change to your desired gradient colors
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Discord',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Color(0xFF33C295), // Text color when gradient isn't applied
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
