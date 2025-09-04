import 'package:flutter/material.dart';
import 'package:netflix_api/controller/bottom_nav_provider.dart';
import 'package:netflix_api/view/saved/saved.dart';
import 'package:provider/provider.dart';
import 'package:netflix_api/utils/colors.dart';
import 'package:netflix_api/view/Profile%20Page/ProfilePage.dart';
import 'package:netflix_api/view/Home%20page/home.dart';
import 'package:netflix_api/view/search%20page/search.dart';

class BottomPg extends StatelessWidget {
  const BottomPg({super.key});

  final List<Widget> pages = const [HomePg(), SearchPg(),Saved(), Profilepage()];

  @override
  Widget build(BuildContext context) {
    final bottomNav = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: pages[bottomNav.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Utils.blackkk,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        selectedIconTheme: const IconThemeData(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNav.currentIndex,
        enableFeedback: false,
        onTap: (int value) {
          bottomNav.changeIndex(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
