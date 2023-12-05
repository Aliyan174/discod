import 'package:flutter/material.dart';
import 'package:discod/friend_request_screen.dart';
import 'package:discod/logout.dart';


void main() {
  runApp(DicodeFrontend());
}

class DicodeFrontend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicode',
      home: DicodeHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Story {
  final String name;
  final String imageUrl;

  Story(this.name, this.imageUrl);
}

class Post {
  final String username;
  final String userImage;
  final String postImage;
  final String caption;

  Post(this.username, this.userImage, this.postImage, this.caption);
}

class DicodeHomePage extends StatelessWidget {
  // Mock data for stories
  final List<Story> stories = [
    Story('SAAD', 'assets/boys1.jpg'),
    Story('ABUBAKAR KHAN', 'assets/boys 2.jpg'),
    Story('ALIYAN', 'assets/boys 3.jpg'),
  ];

  // Mock data for posts
  final List<Post> posts = [
    Post('Aliyan Arshad', 'assets/boys 3.jpg', 'assets/food.jpg', 'Delicious meal! #foodie'),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Dicode',
            style: TextStyle(
              color: Colors.green, // Set the text color to black
              fontSize: 29,
            ),
          ),
          backgroundColor: Colors.transparent, // Set the background color to transparent
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black, // Set the color of the add icon
              onPressed: () {
                // Implement functionality for adding a new post
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black, // Set the color of the search icon to black
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              color: Colors.black,
              onPressed: () {
                // Implement messaging functionality
              },
            ),
          ],
        ),

        body: Column(
          children: [
            // "What's on your mind" section
            Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // User's profile picture and text input
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/profile_picture.png'),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "What's on your mind?",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.image),
                          color: Colors.lightGreen,
                          onPressed: () {
                            // Implement image selection functionality
                          },
                        ),
                      ],
                    ),
                    // Image and image icon section
                  ],
                ),
              ),
            ),

            // Stories section
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1, // +1 for the "Create Story" button
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // The first item is the "Create Story" button
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage('assets/profile_picture.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Create Story',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Display other stories
                    final story = stories[index - 1];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: AssetImage(story.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            story.name,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),

            // Posts section
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(post.userImage),
                          ),
                          title: Text(post.username),
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(post.postImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(post.caption),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () {
                                // Implement like functionality
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.comment),
                              onPressed: () {
                                // Implement comment functionality
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                // Implement share functionality
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Add other widgets or components below as needed
          ],
        ),

        bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.greenAccent,
                  onPressed: () {
                    // Navigate to the home page
                  },
                ),
                IconButton(
                  icon: Icon(Icons.group),
                  onPressed: () {

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

                  },
                ),
              ],
            ),
            ),
        );
    }
}