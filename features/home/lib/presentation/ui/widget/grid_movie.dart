import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared/style/theme.dart';
import '../../../data/model/movie.dart';

class GridMovie extends StatelessWidget {
  final Result movie;

  const GridMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child:Stack(
          children: [
            CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
              imageBuilder: (context, imageProvider) =>
                  Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned.fill(
                top: 150,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300]?.withOpacity(0.5),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        movie.title ?? '-',
                        overflow: TextOverflow.ellipsis,
                        style: CustomTheme().textBlack.headline6,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ))
          ],
        )
    );
  }
}