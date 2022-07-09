import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/comment/comment_bloc.dart';
import '../modals/modals.dart';
import '../widgets/widgets.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;
  const PostDetailsScreen({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        popButton: true,
        title: 'Пост ${post.id}',
      ),
      body: ListView(
        children: [
          PostDetailsScreenWidget(
            post: post,
          ),
        ],
      ),
    );
  }
}

class PostDetailsScreenWidget extends StatelessWidget {
  final Post post;
  const PostDetailsScreenWidget({Key? key, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: const Color(0xff000000),
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            post.body,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: const Color(0xff000000),
                ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Комментарии',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: const Color(0xff000000),
                    ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Sheet(
                            post: post,
                          ));
                },
                child: const Text(
                  'Оставить комментарий',
                ),
              ),
            ],
          ),
          ListComment(
            post: post,
          ),
        ],
      ),
    );
  }
}

class ListComment extends StatelessWidget {
  final Post post;
  const ListComment({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        if (state is CommentLoaded) {
          final comments = state.comments
              .where((element) => element.postId == post.id)
              .toList();
          return SizedBox(
            height: 250.0,
            child: ListView.builder(
              itemCount: comments.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    width: 280,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comments[index].name,
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: const Color(0xff000000),
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                comments[index].email,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: const Color(0xff000000),
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            comments[index].body,
                            maxLines: 4,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        if (state is CommentError) {
          return Center(
            child: Text(state.errorMassage),
          );
        }
        return Container();
      },
    );
  }
}
