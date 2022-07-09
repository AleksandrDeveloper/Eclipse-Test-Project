import 'package:bloc/bloc.dart';
import 'package:eclipse_test/config/api_client.dart';
import 'package:equatable/equatable.dart';
import '../../modals/modals.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _client = ApiClient();

  UserBloc() : super(UserLoading()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      try {
        final usersJson = await _client.getUser();
        emit(UserLoaded(users: usersJson));
      } catch (e) {
        emit(const UserError(errorMassage: 'Произошла ошибка'));
      }
    });
  }
}
