import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'Пользователи',
        popButton: false,
      ),
      body: UserScreenWidget(),
    );
  }
}

class UserScreenWidget extends StatelessWidget {
  const UserScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        if (state is UserLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('user_details_screen',
                        arguments: state.users[index]);
                  },
                  child: CardWidget(
                    title: state.users[index].name,
                    subTitle: Text(
                      state.users[index].username,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              );
            },
          );
        }
        if (state is UserError) {
          return Center(
            child: Text(state.errorMassage),
          );
        }
        return Container();
      },
    );
  }
}
