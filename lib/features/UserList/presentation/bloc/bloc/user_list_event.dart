part of 'user_list_bloc.dart';

abstract class UserListEvent {}

class GetUserList extends UserListEvent {}

class UserListDataEvent extends UserListEvent {}

class OnEventSuccess extends UserListEvent {
  List<UserListData> userList;
  OnEventSuccess({required this.userList});
}
