import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/album/album_bloc.dart';
import '../modals/modals.dart';
import 'widgets.dart';

class ListAlbumWidget extends StatelessWidget {
  final User user;
  final double height;
  final Axis scrollDirection;
  final bool lengthList;
  const ListAlbumWidget({
    Key? key,
    required this.scrollDirection,
    required this.user,
    required this.height,
    required this.lengthList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        if (state is AlbumLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        if (state is AlbumLoaded) {
          final albums = state.albums
              .where((element) => element.userId == user.id)
              .toList();

          return SizedBox(
            height: height,
            child: ListView.builder(
              itemCount: lengthList == true
                  ? albums.length = albums.length
                  : albums.length = 3,
              scrollDirection: scrollDirection,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 30.0),
                  child: AlbumCard(
                    thumbnailUrl: state.photos
                        .where((element) => element.albumId == albums[index].id)
                        .toList()[index]
                        .thumbnailUrl,
                    title: albums[index].title,
                    wight: 280.0,
                    album: state.albums[index],
                  ),
                );
              },
            ),
          );
        }
        if (state is AlbumError) {
          return Center(
            child: Text(state.errorMassage),
          );
        }

        return Container();
      },
    );
  }
}
