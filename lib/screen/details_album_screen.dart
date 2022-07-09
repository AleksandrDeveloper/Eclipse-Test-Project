import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/albumCadr/album_card_bloc.dart';
import '../blocs/photo/photo_bloc.dart';
import '../modals/modals.dart';
import '../widgets/widgets.dart';

class AlbumDetailsScreen extends StatelessWidget {
  final Album album;
  const AlbumDetailsScreen({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Альбом ${album.id}',
        popButton: true,
      ),
      body: AlbumDetailsScreenWidget(album: album),
    );
  }
}

class AlbumDetailsScreenWidget extends StatelessWidget {
  final Album album;
  const AlbumDetailsScreenWidget({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            album.title,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: const Color(0xff000000)),
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        BlocBuilder<AlbumCardBloc, AlbumCardState>(
          builder: (context, state) {
            if (state is AlbumCardInternetNoConnect) {
              return Center(
                child: Text(
                  'Интернет отсупствует',
                  style: Theme.of(context).textTheme.headline2,
                ),
              );
            }
            if (state is AlbumCardInternetConnect) {
              return BlocBuilder<PhotoBloc, PhotoState>(
                builder: (context, state) {
                  if (state is PhotoLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  if (state is PhotoLoaded) {
                    final photos = state.photos
                        .where((element) => element.albumId == album.id)
                        .toList();
                    return Center(
                      child: CarouselSlider.builder(
                          itemCount: photos.length,
                          itemBuilder: (context, index, realIdex) {
                            final photo = photos[index];
                            return Stack(
                              children: [
                                Container(
                                  width: 300,
                                  child: Image.network(photos[index].url),
                                ),
                                Container(
                                  width: 300,
                                  height: 300,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Color.fromARGB(137, 0, 0, 0),
                                      ],
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 16.0,
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          photos[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  color:
                                                      const Color(0xffffffff)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: false,
                            autoPlayInterval: const Duration(seconds: 2),
                            height: 300.0,
                          )),
                    );
                  }
                  if (state is PhotoError) {
                    return Center(
                      child: Text(state.errorMassage),
                    );
                  }
                  return Container();
                },
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}
