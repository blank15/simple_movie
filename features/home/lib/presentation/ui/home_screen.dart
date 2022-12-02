import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/bloc/home/movie_bloc.dart';
import 'package:home/presentation/ui/widget/grid_movie.dart';
import 'package:home/presentation/ui/widget/item_movie.dart';
import 'package:shared/style/theme.dart';
import 'package:shared/util/named_routes.dart';
import '../../data/model/movie.dart';
import '../bloc/home/movie_event.dart';
import '../bloc/home/movie_state.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _page = 1;
  var _isGrid = false;
  List<Result> _listMovie = [];

  final _namedRoutes = Modular.get<NamedRoutes>();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Movie",
          textAlign: TextAlign.center,
        )),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  Modular.to.pushNamed(
                      '${_namedRoutes.aboutScreen}', );
                },
                child: Icon(
                  Icons.account_circle,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isGrid = !_isGrid;
                  });
                },
                child: Icon(
                  _isGrid ? Icons.grid_view_rounded : Icons.list_rounded,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is GetMovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetListMovieSuccess) {
            _listMovie.addAll(state.result);
            return moviesItem();
          } else if (state is GetMovieNoInternet) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'Tidak ada kategori Koneksi Internet',
                    style: CustomTheme().textBlack.headline6,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          } else if (state is GetMovieError) {
            return Center(
              child: Column(
                children: [
                  Text(
                    '${state.message}',
                    style: CustomTheme().textBlack.headline6,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget moviesItem() {
    return _isGrid
        ? GridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            children: List.generate(_listMovie.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: 14.0, top: 14.0, right: 14.0),
                child: GridMovie(
                  movie: _listMovie[index],
                ),
              );
            }),
          )
        : ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 14.0, top: 14.0, right: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ItemMovie(movie: _listMovie[index])],
                ),
              );
            },
            itemCount: _listMovie.length + 1,
          );
  }

  @override
  void initState() {
    super.initState();

    context.read<MovieBloc>().add(GetMovies(page: _page));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _page++;
        context.read<MovieBloc>().add(GetMoviesLoadMore(page: _page));
      }
    });
  }
}
