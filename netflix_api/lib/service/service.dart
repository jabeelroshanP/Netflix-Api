import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:netflix_api/constants/urls.dart';
import 'package:netflix_api/model/model_pg.dart';

class NetFlixService {
  final Dio dio = Dio();

  Future<List<NetModel>> trendingMovies() async {
    try {
      final response = await dio.get(NetUrls.baseUrl);
      if (response.statusCode == 200) {
        log("Trending movies fetched: ${response.data['results'].length} items");
        List data = response.data['results'];
        return data.map((e) => NetModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status: ${response.statusCode}");
    } catch (e) {
      log("Error fetching trending movies: $e");
      throw[];
    }
  }

  Future<List<NetModel>> topRatedd() async {
    try {
      final response = await dio.get(NetUrls.toprated);
      if (response.statusCode == 200) {
        log("Top-rated movies fetched: ${response.data['results'].length} items");
        List data = response.data['results'];
        return data.map((e) => NetModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status: ${response.statusCode}");
    } catch (e) {
      log("Error fetching top-rated movies: $e");
      throw();
    }
  }

  Future<List<NetModel>> upcomingMovies() async {
    try {
      final response = await dio.get(NetUrls.upcomings);
      if (response.statusCode == 200) {
        log("Upcoming movies fetched: ${response.data['results'].length} items");
        List data = response.data['results']; 
        return data.map((e) => NetModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status: ${response.statusCode}");
    } catch (e) {
      log("Error fetching upcoming movies: $e");
      throw();
    }
  }

  Future<List<NetModel>> tvShowsss() async {
    try {
      final response = await dio.get(NetUrls.tvshows);
      if (response.statusCode == 200) {
        log("TV shows fetched: ${response.data['results'].length} items");
        List data = response.data['results'];
        return data.map((e) => NetModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status: ${response.statusCode}");
    } catch (e) {
      log("Error fetching TV shows: $e");
      throw();
    }
  }

  Future<List<NetModel>> searchhh({required String movies}) async {
    final searchUrl = "${NetUrls.search}$movies";
    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        log("Search results fetched: ${response.data['results'].length} items");
        List data = response.data['results'];
        return data.map((e) => NetModel.fromJSon(e)).toList();
      }
      throw Exception("Failed with status: ${response.statusCode}");
    } catch (e) {
      log("Error fetching search results: $e");
      throw();
    }
  }
}





