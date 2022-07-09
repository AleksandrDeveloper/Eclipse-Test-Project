import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/post/post_bloc.dart';
import 'widgets.dart';

class ListPostWidwet extends StatelessWidget {
  final int userId;
  final bool listLength;
  final double height;
  final double padding;
  const ListPostWidwet({
    Key? key,
    required this.userId,
    required this.listLength,
    required this.height,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        );
      }
      if (state is PostLoaded) {
        final posts =
            state.posts.where((element) => element.userId == userId).toList();
        return SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: listLength == true ? posts.length = posts.length : 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: padding,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      'post_details_screen',
                      arguments: posts[index]),
                  child: CardWidget(
                    title: posts[index].title,
                    subTitle: Text(
                      posts[index].body,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
      if (state is PostError) {
        Center(
          child: Text(state.errorMassage),
        );
      }
      return Container();
    });
  }
}
