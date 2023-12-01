import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WalkthroughScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  final List<WalkthroughPage> pages = [
    WalkthroughPage(
      title: "",
      description: "Connect with your Friends and Family",
      image: "assets/1.png",
    ),
    WalkthroughPage(
      title: "",
      description: "Get updated with new events and gatherings of you Friends",
      image: "assets/21.jpg",
    ),
    WalkthroughPage(
      title: "",
      description: "Plan surprises your with Friends and colleagues",
      image: "assets/12.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const duration = const Duration(seconds: 3);
    Timer.periodic(duration, (Timer timer) {
      if (currentPage < pages.length - 1) {
        currentPage++;
      } else {
        timer.cancel();
      }
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF33C295), Colors.white], // Dark green to white
              begin: Alignment(0.2, -0.2),
              end: Alignment(0.2, 0.2),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          WalkthroughImageWidget(
                            image: pages[index].image,
                          ),
                          SizedBox(height: 20),
                          WalkthroughPageWidget(
                            page: pages[index],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
                },
                child: Text("Get Started", style: TextStyle(fontSize: 25, fontFamily: "Poppins")),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber, // Dark green button background
                  onPrimary: Colors.black, // White text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: Size(299, 55),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WalkthroughPage {
  final String title;
  final String description;
  final String image;

  WalkthroughPage({required this.title, required this.description, required this.image});
}

class WalkthroughImageWidget extends StatelessWidget {
  final String image;

  WalkthroughImageWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        image,
        height: 300.0,
      ),
    );
  }
}

class WalkthroughPageWidget extends StatelessWidget {
  final WalkthroughPage page;

  WalkthroughPageWidget({required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0), // Add padding as needed
          child: Text(
            page.title,
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Arial'),
          ),
        ),
        SizedBox(height: 180),
        Center(
       child: Padding(
          padding: const EdgeInsets.all(29.0),
      // Add padding as needed
          child: Text(
            page.description,
            style: TextStyle(fontSize: 27, color: Colors.black,  fontFamily: 'Times new Roman',),
            textAlign: TextAlign.center,
          ),
        ),
        ),
      ],
    );
  }

  }
