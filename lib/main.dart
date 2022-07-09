import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'blocs/album/album_bloc.dart';
import 'blocs/albumCadr/album_card_bloc.dart';
import 'blocs/comment/comment_bloc.dart';
import 'blocs/photo/photo_bloc.dart';
import 'blocs/post/post_bloc.dart';
import 'blocs/user/user_bloc.dart';
import 'config/my_app.dart';

void main() async {
  await Hive.initFlutter();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<AlbumBloc>(create: (context) => AlbumBloc()),
        BlocProvider<PostBloc>(create: (context) => PostBloc()),
        BlocProvider<CommentBloc>(create: (context) => CommentBloc()),
        BlocProvider<AlbumBloc>(create: (context) => AlbumBloc()),
        BlocProvider<PhotoBloc>(create: (context) => PhotoBloc()),
        BlocProvider<AlbumCardBloc>(create: (context) => AlbumCardBloc()),
      ],
      child: const MyApp(),
    ),
  );
}
