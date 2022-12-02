
abstract class MovieEvent  {
  const MovieEvent();
}
class GetMovies extends MovieEvent {
  final int page;
  GetMovies({required this.page});
}

class GetMoviesLoadMore extends MovieEvent {
  final int page;
  GetMoviesLoadMore({required this.page});
}

