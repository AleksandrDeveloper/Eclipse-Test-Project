import 'package:cached_network_image/cached_network_image.dart';
import 'package:eclipse_test/config/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/albumCadr/album_card_bloc.dart';
import '../modals/modals.dart';

class AlbumCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final double wight;
  final Album album;
  const AlbumCard({
    required this.thumbnailUrl,
    required this.title,
    required this.wight,
    required this.album,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed('album_details_screen', arguments: album),
      child: Container(
        width: wight,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180.0,
                child: Text(
                  title,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: const Color(0xff000000)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              BlocBuilder<AlbumCardBloc, AlbumCardState>(
                builder: (context, state) {
                  if (state is AlbumCardInternetNoConnect) {
                    return const SizedBox.shrink();
                  }
                  if (state is AlbumCardInternetConnect) {
                    return SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl: thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
