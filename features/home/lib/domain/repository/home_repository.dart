
import '../../data/model/movie.dart';

abstract class HomeRepository {
  Future<Movie> getMovies(int page);
}