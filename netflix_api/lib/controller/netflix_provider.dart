import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:netflix_api/model/model_pg.dart';
import 'package:netflix_api/service/service.dart';

class NetFlixProviderrr extends ChangeNotifier {
  String imagePath = 'https://image.tmdb.org/t/p/w400/';
  NetFlixService netFlixServi = NetFlixService();
  List<NetModel> listOfDataOfNetFlix = [];
  List<NetModel> toprated = [];
  List<NetModel> upcomingMovies = [];
  List<NetModel> tvList = [];
  List<NetModel> searchList = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  NetFlixProviderrr() {
    getAllData(); 
  }

  Future<void> getAllData() async {
    isLoading = true;
    notifyListeners();
    try {
      listOfDataOfNetFlix = await netFlixServi.trendingMovies();
      log("Trending movies loaded: ${listOfDataOfNetFlix.length}");
    } catch (e) {
      log('Error in getAllData: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> topratedFn() async {
    isLoading = true;
    notifyListeners();
    try {
      toprated = await netFlixServi.topRatedd();
      log("Top-rated movies loaded: ${toprated.length}");
    } catch (e) {
      log('Error in topratedFn: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> upMoviesFn() async {
    isLoading = true;
    notifyListeners();
    try {
      upcomingMovies = await netFlixServi.upcomingMovies();
      log("Upcoming movies loaded: ${upcomingMovies.length}");
    } catch (e) {
      log('Error in upMoviesFn: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> tvFn() async {
    isLoading = true;
    notifyListeners();
    try {
      tvList = await netFlixServi.tvShowsss();
      log("TV shows loaded: ${tvList.length}");
    } catch (e) {
      log('Error in tvFn: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchFn() async {
    isLoading = true;
    notifyListeners();
    log("Searching for: ${searchController.text}");
    try {
      searchList = await netFlixServi.searchhh(movies: searchController.text);
      log("Search results loaded: ${searchList.length}");
      final firstt=searchController.text.trim().toLowerCase();
     searchList = 
     searchList.where((movie) => movie.title?.toLowerCase().contains(firstt) ?? false).toList();
      
    } catch (e) {
      log('Error in searchFn: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}