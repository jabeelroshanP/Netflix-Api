// import 'package:flutter/material.dart';
// import 'package:netflix_api/controller/netflix_provider.dart';
// import 'package:netflix_api/utils/colors.dart';
// import 'package:netflix_api/view/view_page/view_page.dart';
// import 'package:provider/provider.dart';

// class TvshowsPg extends StatefulWidget {
//   const TvshowsPg({super.key});

//   @override
//   State<TvshowsPg> createState() => _TvshowsState();
// }

// class _TvshowsState extends State<TvshowsPg> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final provider = Provider.of<NetFlixProviderrr>(context, listen: false);
//       provider.getAllData();
//       provider.topratedFn();
//       provider.tvFn();
//       provider.upMoviesFn();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Popular on TV Shows",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Utils.whiteee),
//         ),
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: Utils.whiteee),
//       ),
//       body: Consumer<NetFlixProviderrr>(
//         builder: (context, value, child) {
//           if (value.tvList.isEmpty) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: value.tvList.length,
//                   itemBuilder: (context, index) {
//                     var data = value.tvList[index];
//                     return Stack(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) => ViewPg(
//                                       about:
//                                           data.overview ??
//                                           'No description available',
//                                       movieorseries:
//                                           data.media_type ?? 'Unknown',
//                                       image:
//                                           "https://image.tmdb.org/t/p/w500${data.backdrop_path ?? data.poster_path}",
//                                       originallang:
//                                           data.original_language ?? 'Unknown',
//                                       releasdate:
//                                           data.release_date ?? 'No Date',
//                                       titlename: data.title ?? 'No Title',
//                                       index: index,
//                                     ),
//                               ),
//                             );
//                           },

//                           child: SizedBox(
//                             height: 140,
//                             width: double.infinity,
//                             child: Image.network(
//                               data.backdrop_path != null
//                                   ? "${value.imagePath}${data.backdrop_path}"
//                                   : "https://via.placeholder.com/400",
//                               fit: BoxFit.cover,
//                               errorBuilder:
//                                   (context, error, stackTrace) => Center(
//                                     child:
//                                         data.backdrop_path == null
//                                             ? Text("")
//                                             : Text("No Image Available",style: TextStyle(color: Colors.white,),
//                                             ),
//                                   ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 140),
//                           child: Divider(thickness: 3),
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.only(top: 50.0),
//                           child: Center(
//                             child: data.backdrop_path == null 
//                                 ? CircularProgressIndicator():
//                                  Icon(Icons.play_circle_outline,
//                                       color: Utils.whiteee,size: 50,
//                                     ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
