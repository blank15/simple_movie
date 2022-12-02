

import 'package:home/data/datasource/remote_home.dart';
import 'package:home/data/model/movie.dart';
import 'package:home/data/model/movie_detail.dart';
import 'package:home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  RemoteMovie remoteMovie;
  HomeRepositoryImpl({required this.remoteMovie});

  @override
  Future<Movie> getMovies(int page) {
    return remoteMovie.getMovies(page);
  }

  @override
  Future<MovieDetail> getDetailMovie(int id) {
   return remoteMovie.getDetailMovie(id);
  }

}