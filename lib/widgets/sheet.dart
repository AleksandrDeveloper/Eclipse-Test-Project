import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/comment/comment_bloc.dart';
import '../modals/modals.dart';
import 'widgets.dart';

class Sheet extends StatelessWidget {
  final Post post;
  const Sheet({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final bodyController = TextEditingController();

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          height: 440,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Оставьте комментарий',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: const Color(0xffffffff),
                          ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFieldWidget(
                      controller: nameController,
                      hintText: 'Имя',
                      textInputType: TextInputType.name,
                    ),
                    TextFieldWidget(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                    ),
                    TextFieldWidget(
                      controller: bodyController,
                      hintText: 'Комментарий',
                      textInputType: TextInputType.multiline,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    final name = nameController.text;
                    final email = emailController.text;
                    final body = bodyController.text;
                    final postId = post.id;

                    BlocProvider.of<CommentBloc>(context).add(PostComment(
                      name: name,
                      email: email,
                      body: body,
                      postId: postId,
                    ));
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: const Color(0xffffffff),
                    ),
                    child: Center(
                      child: Text(
                        'Опубликовать',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
