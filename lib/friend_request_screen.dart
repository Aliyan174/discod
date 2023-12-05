import 'package:discod/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:discod/DiscodeFrontend.dart';
import 'package:discod/logout.dart';

class FriendRequestScreen extends StatefulWidget {
  @override
  _FriendRequestScreenState createState() => _FriendRequestScreenState();
}

class _FriendRequestScreenState extends State<FriendRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFriendRequestCard('SAAD', '1 mutual friend', 'assets/boys1.jpg'),
            _buildFriendRequestCard('ABUBAKAR KHAN', '3 mutual friends', 'assets/boys 2.jpg'),
            _buildFriendRequestCard('ALIYAN', '5 mutual friends', 'assets/boys 3.jpg'),
            // Add more friend request cards as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => DicodeHomePage())); // Navigate to the home page
              },
            ),
            IconButton(
              icon: Icon(Icons.group),
              color: Colors.greenAccent,
              onPressed: () {
                // Navigate to the friend requests page
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Navigate to the notifications page
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginPage()));  // Implement menu functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendRequestCard(String name, String mutualFriends, String imageUrl) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    mutualFriends,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            _buildFriendRequestButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendRequestButtons() {
    return Column(
        children: [
        ElevatedButton(
        onPressed: () {
      // Accept friend request
    },
    style: ElevatedButton.styleFrom(primary: Colors.green),
    child: Text('Accept'),
    ),
    SizedBox(height: 8),
    OutlinedButton(
    onPressed: () {
    // Reject friend request
    },
    style: OutlinedButton.styleFrom(primary: Colors.red),
    child: Text('Reject'),
    ),
    ],
    );
    }
}