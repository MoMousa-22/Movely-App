import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);
  Future<List<Movie>> excute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
