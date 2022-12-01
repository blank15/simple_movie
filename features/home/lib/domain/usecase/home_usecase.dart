
import '../../data/model/movie.dart';
import '../repository/home_repository.dart';

abstract class HomeUseCase {
  Future<Movie> getMovies(int page);
}

class HomeUseCaseImpl extends HomeUseCase {
  HomeRepository homeRepository;

  HomeUseCaseImpl({required this.homeRepository});

  @override
  Future<Movie> getMovies(int page) {
    return homeRepository.getMovies(page);
  }
}
