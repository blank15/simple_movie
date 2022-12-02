import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/home/detail/detail_bloc.dart';
import '../bloc/home/detail/detail_event.dart';
import '../bloc/home/detail/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/style/theme.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailMovieBloc,DetailMovieState>(
        builder: (context,state){
          if (state is GetDetailMovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetDetailMovieSuccess) {
            var data = state.result;
            return NestedScrollView(headerSliverBuilder:(context, innerBoxIsScrolled){
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title:  Text(
                      data.title ?? '-',
                      overflow: TextOverflow.ellipsis,
                      style: CustomTheme().textBlack.headline6?.apply(
                        color: Colors.white
                      ),
                      maxLines: 1,
                    ),
                    background:
                    CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500/${data.backdropPath}',
                      imageBuilder: (context, imageProvider) =>
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                )
              ];
            },

                body: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi',
                        overflow: TextOverflow.ellipsis,
                        style: CustomTheme().textBlack.bodyLarge,
                        maxLines: 1,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        data.overview ?? '-',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    ],
                  ),
                ));
          } else if (state is GetDetailMovieNoInternet) {
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
          } else if (state is GetDetailMovieError) {
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
        }
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    context.read<DetailMovieBloc>().add(GetDetailMovie(id: widget.id));
  }
}
