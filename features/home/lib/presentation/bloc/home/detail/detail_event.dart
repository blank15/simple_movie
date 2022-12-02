
abstract class DetailMovieEvent  {
  const DetailMovieEvent();
}


class GetDetailMovie extends DetailMovieEvent {
  final int id;
  GetDetailMovie({required this.id});
}