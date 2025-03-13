import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_api/utils/colors.dart';

Widget playViewsPlay(){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: Utils.whiteee,borderRadius: BorderRadius.circular(7)),

      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(10),
              Icon(Icons.play_arrow, color: Colors.black, size: 34),
              Text("Play", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600)),
            ],
          ),
    ),
  );
}

Widget downloadContainer(){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: const Color.fromARGB(255, 185, 185, 185),borderRadius: BorderRadius.circular(7)),

      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(10),
              Text("Download", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600)),
               Icon(Icons.download_rounded, color: Colors.black, size: 34),

            ],
          ),
    ),
  );
}
