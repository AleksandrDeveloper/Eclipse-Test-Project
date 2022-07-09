import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class PostScreen extends StatelessWidget {
  final int userId;
  const PostScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Посты',
        popButton: true,
      ),
      body: PostScreenWidget(userId: userId),
    );
  }
}

class PostScreenWidget extends StatelessWidget {
  final int userId;
  const PostScreenWidget({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListPostWidwet(
      listLength: true,
      userId: userId,
      height: MediaQuery.of(context).size.height,
      padding: 16.0,
    );
  }
}
