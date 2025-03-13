import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_api/controller/netflix_provider.dart';
import 'package:netflix_api/utils/colors.dart';
import 'package:provider/provider.dart';

class DownloadsPg extends StatelessWidget {
  const DownloadsPg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Downloads",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Utils.whiteee),
        ),
        backgroundColor: Utils.blackkk,
        actions: [
          Icon(Icons.cast, color: Utils.whiteee),
          const Gap(20),
          Icon(Icons.search, color: Utils.whiteee),
          const Gap(10),
          Icon(Icons.more_vert_rounded, color: Utils.whiteee),
        ],
      ),
      body: Consumer<NetFlixProviderrr>(
        builder: (context, value, child) {
          log("DownloadsPg: dowload length = ${value.listOfDataOfNetFlix.length}");
          if (value.listOfDataOfNetFlix.isEmpty) {
            return const Center(
              child: Text(
                "No downloads available",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          var imglist = Provider.of<NetFlixProviderrr>(context, listen: false).imagePath ??
              'https://image.tmdb.org/t/p/w400/';

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Your Downloads", style: TextStyle(fontSize: 21)),
                ),
              ),
              const Gap(10),
              Container(
                height: 50,
                width: double.infinity,
                color: const Color.fromARGB(255, 98, 96, 96),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info, color: Colors.white),
                          const Gap(10),
                          Text('Start Download', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Text("ON", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Align(alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 175,
                            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: value.listOfDataOfNetFlix[index].poster_path != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      "$imglist${value.listOfDataOfNetFlix[index].backdrop_path}",
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        log("Error loading image: $error");
                                        return const Icon(Icons.image_not_supported, color: Colors.red, size: 50);
                                      },
                                    ),
                                  )
                                : const Icon(Icons.image_not_supported, color: Colors.red, size: 50),
                          ),Gap(10),
                          Expanded(
                            child: Text(value.listOfDataOfNetFlix[index].title ?? "No Tite",
                             style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold), 
                             maxLines: 2, ),
                          ),
                          Icon(Icons.more_vert,color: Utils.whiteee,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}