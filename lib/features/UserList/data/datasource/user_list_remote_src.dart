import 'package:flutter_example/features/UserList/data/model/user_list_model.dart';

abstract class UserListRemoteSrc{
  Stream<UserListModel> fetchUserList();
}