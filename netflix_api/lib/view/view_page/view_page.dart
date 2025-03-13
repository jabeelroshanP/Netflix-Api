import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_api/controller/netflix_provider.dart';
import 'package:netflix_api/utils/colors.dart';
import 'package:netflix_api/widgets/home%20widget.dart';
import 'package:netflix_api/widgets/viewWidget.dart';
import 'package:provider/provider.dart';

class ViewPg extends StatelessWidget {
  final String titlename;
  final String originallang;
  final String image;
  final String about;
  final String releasdate;
  final String movieorseries;
  final int index;

  const ViewPg({
    super.key,
    required this.about,
    required this.titlename,
    required this.originallang,
    required this.image,
    required this.releasdate,
    required this.movieorseries,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          titlename,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: IconThemeData(color: Utils.whiteee),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.download, color: Colors.white),
                      SizedBox(width: 10),
                      Text("Downloading Started"),
                    ],
                  ),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            icon: Icon(Icons.download),
          ),
          Gap(5),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                
                SizedBox(
                  child: Image.network(
                    image,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160.0, top: 150),
                  child: CircleAvatar(radius: 35,backgroundColor: Colors.black54,
                  child: Icon(Icons.play_arrow,size: 45,color: const Color.fromARGB(255, 255, 255, 255),),),
                  
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$titlename",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "$releasdate",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "$originallang",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.hd_outlined, color: Utils.whiteee),
                    ],
                  ),
                  Gap(10),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow, color: Utils.blackkk, size: 34),
                        Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(Icons.download, color: Colors.white),
                              SizedBox(width: 10),
                              Text("Downloading Started"),
                              
                            ],
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 34,
                          ),
                          Text(
                            "Download",
                            style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 239, 238, 238),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "$movieorseries",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 170, 40, 40),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(  
                    about,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Gap(50),
                        Column(
                          children: [
                            Icon(Icons.add, color: Utils.whiteee, size: 45),
                            Text("My List"),
                          ],
                        ),
                        Gap(50),
                        Column(
                          children: [
                            Icon(
                              Icons.thumb_up_outlined,
                              color: Utils.whiteee,
                              size: 45,
                            ),
                            Text("Rate"),
                          ],
                        ),
                        Gap(50),
                        Column(
                          children: [
                            Icon(Icons.share, color: Utils.whiteee, size: 45),
                            Text("Share"),
                          ],
                        ),
                        Gap(10),
                      ],
                    ),
                  ),
                  Consumer<NetFlixProviderrr>(
                    builder: (context, value, child) {
                      
                   return Column(
                     children: [
                      listContainer(listCategories: value.toprated,direction: Axis.horizontal),Gap(10),
                       listContainer(listCategories:value.listOfDataOfNetFlix ,direction: Axis.horizontal),Gap(10),
                       listContainer(listCategories:value.upcomingMovies ,direction: Axis.horizontal),
                     ],
                   );
                   
                   }
                   )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
