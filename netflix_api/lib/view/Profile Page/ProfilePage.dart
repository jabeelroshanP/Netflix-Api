
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_api/utils/colors.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Utils.whiteee),
        ),
        backgroundColor: Utils.blackkk,
        actions: [
          Icon(Icons.more_vert_rounded, color: Utils.whiteee),
        ],
      ),
     
    );
  }
}