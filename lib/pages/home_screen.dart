import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_redesign/pages/activity_screen.dart';
import 'package:insta_redesign/pages/create_post_screen.dart';
import 'package:insta_redesign/pages/feed_screen.dart';
import 'package:insta_redesign/pages/profile_screen.dart';
import 'package:insta_redesign/pages/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  HomeScreen({this.userId});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 10.0,
        actions: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo_camera),
                    iconSize: 30.0,
                    onPressed: () => print('Story'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Text(
                      "Instagram",
                      style: TextStyle(fontSize: 35.0, fontFamily: "Billabong"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: IconButton(
                      icon: Icon(Icons.live_tv),
                      iconSize: 30.0,
                      onPressed: () => print('IGTV'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 30.0,
                    onPressed: () => print('Direct Messages'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(userId: widget.userId),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        activeColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera,
              size: 35.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
