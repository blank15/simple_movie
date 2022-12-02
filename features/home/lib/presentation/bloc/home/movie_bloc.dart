import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/presentation/bloc/home/movie_event.dart';
import 'package:home/presentation/bloc/home/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final HomeUseCase homeUseCase;

  MovieBloc({required this.homeUseCase}) : super(GetMovieInitial());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is GetMovies) {
      yield* _getListMovie(event.page);
    }else if(event is GetMoviesLoadMore){
      yield* _getListMovieLoadMore(event.page);
    }
  }

  Stream<MovieState> _getListMovie(int page) async* {
    try {
      yield GetMovieLoading();
      final response = await homeUseCase.getMovies(page);
      yield GetListMovieSuccess(result: response.results);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield GetMovieNoInternet();
      } else {
        if (kReleaseMode) {
          yield GetMovieError(
              message: "Mohon maaf sedang terjadi gangguan");
        } else {
          yield GetMovieError(message: "${e.message}");
        }
      }
    }
  }

  Stream<MovieState> _getListMovieLoadMore(int page) async* {
    try {
      final response = await homeUseCase.getMovies(page);
      yield GetListMovieSuccess(result: response.results);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield GetMovieNoInternet();
      } else {
        if (kReleaseMode) {
          yield GetMovieError(
              message: "Mohon maaf sedang terjadi gangguan");
        } else {
          yield GetMovieError(message: "${e.message}");
        }
      }
    }
  }
}