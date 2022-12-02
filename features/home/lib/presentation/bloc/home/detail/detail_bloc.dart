import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/presentation/bloc/home/movie_event.dart';
import 'package:home/presentation/bloc/home/movie_state.dart';

import 'detail_event.dart';
import 'detail_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final HomeUseCase homeUseCase;

  DetailMovieBloc({required this.homeUseCase}) : super(GetDetailMovieInitial());

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {
    if (event is GetDetailMovie) {
      yield* _getDetailMovie(event.id);
    }
  }
  Stream<DetailMovieState> _getDetailMovie(int id) async* {
    try {
      yield GetDetailMovieLoading();
      final response = await homeUseCase.getDetailMovie(id);
      yield GetDetailMovieSuccess(result: response);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield GetDetailMovieNoInternet();
      } else {
        if (kReleaseMode) {
          yield GetDetailMovieError(
              message: "Mohon maaf sedang terjadi gangguan");
        } else {
          yield GetDetailMovieError(message: "${e.message}");
        }
      }
    }
  }
}