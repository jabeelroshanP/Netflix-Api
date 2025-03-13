import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_api/controller/netflix_provider.dart';
import 'package:netflix_api/view/view_page/view_page.dart';
import 'package:provider/provider.dart';

Widget infoButtonnn({required IconData? iconnn, required String label}) {
  return Column(
    children: [
      Icon(iconnn, size: 34, color: Colors.white),
      Text(label, style: const TextStyle(fontSize: 18, color: Colors.white)),
    ],
  );
}

Widget playButtonContainerrr() {
  return Stack(
    children: [
      Container(
        height: 50,
        width: 110,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Row(
          children: [
            Gap(10),
            Icon(Icons.play_arrow, color: Colors.black, size: 34),
            Text("Play", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    ],
  );
}

Widget titleTextsss(String titleee) {
  return Text(
    titleee,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  );
}

Widget listContainer({required List<dynamic> listCategories, dynamic direction}) {
  return Consumer<NetFlixProviderrr>(
    builder: (context, value, child) {
      if (listCategories.isEmpty) {
        return const Center(
          child: CircularProgressIndicator()
        );
      }

      return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: direction,
          itemCount: listCategories.length,
          itemBuilder: (context, index) {
            var data = listCategories[index];
            var imgUrl = "${value.imagePath}${data.poster_path ?? ''}";

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPg(
                        about: data.overview ?? '',
                        movieorseries: data.media_type ?? '',
                        image: imgUrl,
                        originallang: data.original_language ?? '',
                        releasdate: data.release_date ?? '',
                        titlename: data.title ?? '',
                        index: index,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imgUrl,
                    height: 170,
                    width: 130.79,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error, color: Colors.red)),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
