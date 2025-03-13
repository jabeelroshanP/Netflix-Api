import 'package:flutter/material.dart';
import 'package:netflix_api/utils/colors.dart';
import 'package:netflix_api/view/download%20page/downloads.dart';
import 'package:netflix_api/view/Home%20page/home.dart';
import 'package:netflix_api/view/search%20page/search.dart';

class BottomPg extends StatefulWidget {
  const BottomPg({super.key});

  @override
  State<BottomPg> createState() => _BottomPgState();
}

int indexNums=0;

final pages=[
  HomePg(),
  SearchPg(),
  DownloadsPg(),


];
class _BottomPgState extends State<BottomPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexNums],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Utils.blackkk,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        selectedIconTheme: IconThemeData(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        currentIndex: indexNums,
        enableFeedback: false,
        
        onTap: (int value) {
          return setState(() {
            indexNums=value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.download_for_offline_outlined),label: "Downloads"),

        ],
       ),
    );
  }
}