import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/features/UserList/domain/entity/user_list_entity.dart';
import 'package:flutter_example/features/UserList/domain/usecase/user_list_usecase.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListUsecase userListUsecase;
  UserListBloc(this.userListUsecase) : super(UserListInitial()) {
    // @override
    // Stream<UserListState> mapEventToState(
    //   UserListEvent event,
    // ) async* {
    //   if (event is GetUserList) {
    //     fetchList();
    //   } else if (event is OnEventSuccess) {
    //     yield UserListLoaded(title: "uselist", userList: event.userList);
    //   }
    // }

    on<GetUserList>(_fetchList);
  }

  _fetchList(GetUserList event, Emitter<UserListState> emit) async {
    var result = await userListUsecase.call(NoParams()).single;

    result.fold(
        (l) => {print("error state => ")},
        (res) => emit(
            UserListLoaded(title: "user list", userList: res.userListData)));

    // result.call(NoParams()).listen((event) {
    //   event.fold(
    //       (onError) => null,
    //       (res) => emit(
    //           UserListLoaded(title: "user list", userList: res.userListData)));
    // });
    //  userListUsecase.call(NoParams()).listen((event) {
    //   event.fold((onError) {
    //     return null;
    //   }, (res) {
    //     emit(UserListLoaded(title: "uselist", userList: res.userListData));
    //   });
    // });
  }
}
