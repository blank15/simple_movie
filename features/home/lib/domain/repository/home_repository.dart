
import '../../data/model/movie.dart';
import '../../data/model/movie_detail.dart';

abstract class HomeRepository {
  Future<Movie> getMovies(int page);
  Future<MovieDetail> getDetailMovie(int id);
}