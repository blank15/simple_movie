
import '../../data/model/movie.dart';
import '../../data/model/movie_detail.dart';
import '../repository/home_repository.dart';

abstract class HomeUseCase {
  Future<Movie> getMovies(int page);

  Future<MovieDetail> getDetailMovie(int id);
}

class HomeUseCaseImpl extends HomeUseCase {
  HomeRepository homeRepository;

  HomeUseCaseImpl({required this.homeRepository});

  @override
  Future<Movie> getMovies(int page) {
    return homeRepository.getMovies(page);
  }

  @override
  Future<MovieDetail> getDetailMovie(int id) {
   return homeRepository.getDetailMovie(id);
  }
}
