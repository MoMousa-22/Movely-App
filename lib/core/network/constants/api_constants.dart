class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "123847267b69185b00490b3b22c42a61";

  static const String nowPlayingEndPoint = "/movie/now_playing";
  static const String popularEndPoint = "/movie/popular";
  static const String topRatedEndPoint = "/movie/top_rated";

  static const String nowPlayingPath =
      "$baseUrl$nowPlayingEndPoint?api_key=$apiKey";
  static const String popularPath = "$baseUrl$popularEndPoint?api_key=$apiKey";
  static const String topRatedPath =
      "$baseUrl$topRatedEndPoint?api_key=$apiKey";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';
}
