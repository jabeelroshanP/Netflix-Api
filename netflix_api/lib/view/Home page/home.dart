import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_api/controller/netflix_provider.dart';
import 'package:netflix_api/widgets/home%20widget.dart';
import 'package:netflix_api/view/tv%20shows%20page/tvShows.dart';
import 'package:provider/provider.dart';

class HomePg extends StatefulWidget {
  const HomePg({super.key});

  @override
  State<HomePg> createState() => _HomeState();
}

class _HomeState extends State<HomePg> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<NetFlixProviderrr>(context, listen: false);
      provider.getAllData();
      provider.topratedFn();
      provider.tvFn();
      provider.upMoviesFn();
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<NetFlixProviderrr>(
        builder: (context, value, _) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }
          if (value.listOfDataOfNetFlix.isEmpty) {
            return const Center(child: CircularProgressIndicator()
            );
          }
          var imglist = value.imagePath;
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 550,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("$imglist${value.listOfDataOfNetFlix[0].poster_path ?? ''}"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/n.png', height: 120, width: 50),
                              const Gap(25),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TvshowsPg()));
                                },
                                child: titleTextsss("TV Shows"),
                              ),
                              const Gap(25),
                              titleTextsss("Movies"),
                              const Gap(25),
                              titleTextsss("My List"),
                            ],
                          ),
                          const Gap(340),
                          const Text(
                            "TV Show • Supernatural • Thriller • US",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 7),
                              infoButtonnn(iconnn: Icons.add, label: 'My List'),
                              playButtonContainerrr(),
                              infoButtonnn(iconnn: Icons.info_outline, label: "Info"),
                              const SizedBox(width: 7),
                            ],
                          ),
                          
                        ],
                      ),
                    ),Gap(15),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: titleTextsss("Recent Releases"),
               ),Gap(10),
                    listContainer(listCategories: value.listOfDataOfNetFlix,direction: Axis.horizontal), 
                    Gap(15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: titleTextsss("Top Rated"),
                    ),Gap(10),
                    listContainer(listCategories: value.toprated,direction: Axis.horizontal),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: titleTextsss("Upcoming Movies"),
                    ),Gap(10),
          
                    listContainer(listCategories: value.upcomingMovies,direction:Axis.horizontal),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: titleTextsss("TV Shows"),
                    ),Gap(10),
                    listContainer(listCategories: value.tvList,direction: Axis.horizontal)
          
          
          
          
                  ],
          
                  
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}