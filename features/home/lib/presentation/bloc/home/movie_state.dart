import 'package:home/data/model/movie.dart';

abstract class MovieState{
  const MovieState();
}

class GetMovieInitial extends MovieState {}
class GetListMovieLoading extends MovieState {}
class GetListMovieError extends MovieState {
  final String message;
  GetListMovieError({required this.message});
}
class GetListMovieSuccess extends MovieState {
  final List<Result> result;
  GetListMovieSuccess({required this.result});
}
class GetListMovieNoInternet extends MovieState{}