import 'package:eclipse_test/config/route.dart';
import 'package:eclipse_test/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user/user_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUser());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final route = AppRoute();
    return MaterialApp(
      title: 'Eclipse Test Project',
      theme: mainTheme(),
      debugShowCheckedModeBanner: false,
      routes: route.route,
      initialRoute: route.initialRoutes,
    );
  }
}
