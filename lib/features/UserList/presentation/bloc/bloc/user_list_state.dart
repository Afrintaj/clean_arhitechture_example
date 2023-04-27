part of 'user_list_bloc.dart';

abstract class UserListState {}

class UserListInitial extends UserListState {}

class UserListLoaded extends UserListState {
  String? title;
  List<UserListData> userList;
  UserListLoaded({required this.title, required this.userList});
}
