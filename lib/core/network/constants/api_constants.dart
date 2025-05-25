class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "123847267b69185b00490b3b22c42a61";

  static const String nowPlayingEndPoint = "movie/now_playing";
  static const String popularEndPoint = "movie/popular";
  static const String topRatedEndPoint = "movie/top_rated";

  static const String nowPlayingPath = "$baseUrl+$nowPlayingEndPoint+$apiKey";
  static const String popularPath = "$baseUrl+$popularEndPoint+$apiKey";
  static const String topRatedPath = "$baseUrl+$topRatedEndPoint+$apiKey";
}
