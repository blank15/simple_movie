import 'package:home/data/model/movie.dart';

import '../../../data/model/movie_detail.dart';

abstract class MovieState {
  const MovieState();
}

class GetMovieInitial extends MovieState {}

class GetMovieLoading extends MovieState {}

class GetMovieError extends MovieState {
  final String message;

  GetMovieError({required this.message});
}

class GetListMovieSuccess extends MovieState {
  final List<Result> result;

  GetListMovieSuccess({required this.result});
}

class GetMovieNoInternet extends MovieState {}

