import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/album/album_bloc.dart';
import '../blocs/albumCadr/album_card_bloc.dart';
import '../blocs/comment/comment_bloc.dart';
import '../blocs/photo/photo_bloc.dart';
import '../blocs/post/post_bloc.dart';
import '../modals/modals.dart';
import '../widgets/widgets.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;
  const UserDetailsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<PostBloc>(context).add(GetPost());
    BlocProvider.of<CommentBloc>(context).add(GetComment());
    BlocProvider.of<AlbumBloc>(context).add(GetAlbum());
    BlocProvider.of<PhotoBloc>(context).add(GetPhoto());
    BlocProvider.of<AlbumCardBloc>(context).add(GetImage());

    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        popButton: true,
        title: widget.user.username,
      ),
      body: UserDetailsScreenWidget(
        user: widget.user,
      ),
    );
  }
}

class UserDetailsScreenWidget extends StatelessWidget {
  final User user;
  const UserDetailsScreenWidget({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              DetailsInfo(
                title: 'Name:',
                detail: user.name,
              ),
              DetailsInfo(
                title: 'Email:',
                detail: user.email,
              ),
              DetailsInfo(
                title: 'Phone:',
                detail: user.phone,
              ),
              DetailsInfo(
                title: 'Web site:',
                detail: user.website,
              ),
              const SizedBox(
                height: 40.0,
              ),
              const DetailsInfo(
                title: 'Working:',
                detail: '',
              ),
              DetailsInfo(
                title: 'Company name:',
                detail: user.company.name,
              ),
              DetailsInfo(
                title: 'Bs:',
                detail: user.company.bs,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Catch Phrase:',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: const Color(0xff000000),
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 200,
                    child: Text(
                      user.company.catchPhrase,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const DetailsInfo(
                title: 'Address:',
                detail: '',
              ),
              DetailsInfo(
                title: 'City:',
                detail: user.address.city,
              ),
              DetailsInfo(
                title: 'Street:',
                detail: user.address.street,
              ),
              DetailsInfo(
                title: 'Suite:',
                detail: user.address.suite,
              ),
              DetailsInfo(
                title: 'Geo:',
                detail: '${user.address.geo.lat}, ${user.address.geo.lng}',
              ),
              DetailsInfo(
                title: 'Zip Code:',
                detail: user.address.zipcode,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Посты',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: const Color(0xff000000),
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('post_screen', arguments: user.id);
                    },
                    child: const Text(
                      'посмотреть все посты',
                    ),
                  )
                ],
              ),
              ListPostWidwet(
                userId: user.id,
                listLength: false,
                height: 310,
                padding: 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Альбомы',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: const Color(0xff000000),
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('album_screen', arguments: user);
                    },
                    child: const Text(
                      'посмотреть все альбомы',
                    ),
                  )
                ],
              ),
              ListAlbumWidget(
                scrollDirection: Axis.horizontal,
                height: 140.0,
                user: user,
                lengthList: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
