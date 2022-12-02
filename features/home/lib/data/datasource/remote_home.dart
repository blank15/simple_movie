import 'package:core/network/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:home/data/model/movie.dart';

import '../model/movie_detail.dart';

abstract class RemoteMovie {
  Future<Movie> getMovies(int page);
  Future<MovieDetail> getDetailMovie(int id);
}

class RemoteMovieImpl extends RemoteMovie {
  final Dio dio;

  RemoteMovieImpl({required this.dio});
  @override
  Future<Movie> getMovies(int page)  async {
    if (kReleaseMode) {
      dio.options.baseUrl = ApiConstant.baseUrlProd;
    } else {
      dio.options.baseUrl = ApiConstant.baseUrlDebug;
    }
  
    Response response = await  dio.get("movie/now_playing",queryParameters: {
      'api_key': ApiConstant.apiKey,
      'page': '$page',
    });
    return Movie.fromJson(response.data);
  }

  @override
  Future<MovieDetail> getDetailMovie(int id) async {
    if (kReleaseMode) {
      dio.options.baseUrl = ApiConstant.baseUrlProd;
    } else {
      dio.options.baseUrl = ApiConstant.baseUrlDebug;
    }

    Response response = await  dio.get("movie/$id",queryParameters: {
      'api_key': ApiConstant.apiKey,
    });

    return MovieDetail.fromJson(response.data);
  }

}