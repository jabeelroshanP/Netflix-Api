class NetModel {
  String? backdrop_path;
  String? title;
  String? original_title;
  int? id;
  String? overview;
  String? poster_path;
  bool? adult;
  String? original_language;
  double? popularity;
  String? release_date;
  bool? video;
  double? vote_average;
  int? vote_count;

  NetModel({
    required this.adult,
    required this.backdrop_path,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  factory NetModel.fromJSon(Map<String, dynamic> json) {
    return NetModel(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity']?.toDouble(),
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average']?.toDouble(),
      vote_count: json['vote_count'],
    );
  }

  get media_type => null;
}