import '../../../../data/model/movie_detail.dart';

abstract class DetailMovieState {
  const DetailMovieState();
}

class GetDetailMovieInitial extends DetailMovieState {}

class GetDetailMovieLoading extends DetailMovieState {}

class GetDetailMovieError extends DetailMovieState {
  final String message;

  GetDetailMovieError({required this.message});
}

class GetDetailMovieNoInternet extends DetailMovieState {}

class GetDetailMovieSuccess extends DetailMovieState {
  final MovieDetail result;

  GetDetailMovieSuccess({required this.result});
}
