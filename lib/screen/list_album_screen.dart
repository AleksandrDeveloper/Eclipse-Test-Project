import 'package:flutter/material.dart';

import '../modals/modals.dart';
import '../widgets/widgets.dart';

class AlbumScreen extends StatelessWidget {
  final User user;

  const AlbumScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Альбомы',
        popButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: ListAlbumWidget(
          height: MediaQuery.of(context).size.height,
          scrollDirection: Axis.vertical,
          user: user,
          lengthList: true,
        ),
      ),
    );
  }
}
