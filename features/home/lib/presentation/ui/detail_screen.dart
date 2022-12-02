import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/style/theme.dart';

import '../bloc/home/detail/detail_bloc.dart';
import '../bloc/home/detail/detail_event.dart';
import '../bloc/home/detail/detail_state.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
        if (state is GetDetailMovieLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetDetailMovieSuccess) {
          var data = state.result;
          return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500/${data.backdropPath}',
                        imageBuilder: (context, imageProvider) => Container(
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
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                width: 100,
                                height: 150,
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500/${data.posterPath}',
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title ?? '-',
                                        style:
                                            CustomTheme().textBlack.titleMedium,
                                      ),
                                      SizedBox(height: 10.0),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 2.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Text('${data.releaseDate}'),
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18.0,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            ((data.voteAverage! / 2)
                                                .toStringAsFixed(1)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 50,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.genres?.length,
                                          itemBuilder:
                                              (BuildContext context, int index) =>
                                                  Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Chip(
                                                        label:Padding(
                                                          padding: EdgeInsets.all(5),
                                                          child: Text('${data.genres![index].name}'),
                                                        )
                                          ),
                                                  ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        Text(
                          'Deskripsi',
                          overflow: TextOverflow.ellipsis,
                          style: CustomTheme().textBlack.bodyLarge,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.overview ?? '-',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                        ),
                      ])));
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
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<DetailMovieBloc>().add(GetDetailMovie(id: widget.id));
  }
}
