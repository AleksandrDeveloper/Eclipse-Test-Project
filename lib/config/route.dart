import 'package:flutter/material.dart';
import '../modals/modals.dart';
import '../screen/screens.dart';

class AppRoute {
  final Map<String, Widget Function(BuildContext)> route = {
    'user_screen': ((context) => const UserScreen()),
    'user_details_screen': ((context) {
      final user = ModalRoute.of(context)!.settings.arguments as User;
      return UserDetailsScreen(user: user);
    }),
    'post_screen': ((context) {
      final userId = ModalRoute.of(context)!.settings.arguments as int;
      return PostScreen(userId: userId);
    }),
    'post_details_screen': ((context) {
      final post = ModalRoute.of(context)!.settings.arguments as Post;
      return PostDetailsScreen(post: post);
    }),
    'album_screen': ((context) {
      final user = ModalRoute.of(context)!.settings.arguments as User;
      return AlbumScreen(user: user);
    }),
    'album_details_screen': ((context) {
      final album = ModalRoute.of(context)!.settings.arguments as Album;
      return AlbumDetailsScreen(
        album: album,
      );
    }),
  };
  final String initialRoutes = 'user_screen';
}
