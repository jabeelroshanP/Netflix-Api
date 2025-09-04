import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_api/controller/netflix_provider.dart';
import 'package:netflix_api/utils/colors.dart';
import 'package:provider/provider.dart';

class SearchPg extends StatefulWidget {
  const SearchPg({super.key});

  @override
  State<SearchPg> createState() => _SearchPgState();
}

class _SearchPgState extends State<SearchPg> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetFlixProviderrr>(context, listen: false).searchFn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/n.png", height: 120, width: 50),
        automaticallyImplyLeading: false,
        backgroundColor: Utils.blackkk,
        title: Consumer<NetFlixProviderrr>(
          builder: (context, valu, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  contentPadding: const EdgeInsets.all(5),
                  filled: true,
                  fillColor: Colors.grey[600],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSubmitted: (value) => valu.searchFn(),
                controller: valu.searchController,
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Consumer<NetFlixProviderrr>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (value.searchList.isEmpty && value.searchController.text.isNotEmpty) {
              return const Center(child: Text("No results found", style: TextStyle(color: Colors.white)));
              
            }
            
            if (value.searchList.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(15),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Most Searches",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                 Gap(10),
                     Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: value.listOfDataOfNetFlix.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: "${value.imagePath}${value.listOfDataOfNetFlix[index].poster_path}",
                              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                            ),
                          );
                        },
                      ),
                    ),
                  
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(30),
                   Text(
                    "Top Searches",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Utils.whiteee),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.searchList.length,
                      itemBuilder: (context, index) {
                        var data = value.searchList[index];
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 130,
                                width: 180,
                                child: CachedNetworkImage(
                                  imageUrl: "${value.imagePath}${data.backdrop_path}",
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                ),
                              ),
                            ),
                            const Gap(20),
                            Expanded(child: Text(data.title ?? 'No title', style: const TextStyle(fontSize: 18))),
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.play_arrow_sharp, color: Colors.white),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}