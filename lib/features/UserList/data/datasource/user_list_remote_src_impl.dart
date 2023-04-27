import 'package:flutter_example/features/UserList/data/datasource/user_list_remote_src.dart';
import 'package:flutter_example/features/UserList/data/model/user_list_model.dart';

class UserListRemoteSrcImpl implements UserListRemoteSrc {
  @override
  Stream<UserListModel> fetchUserList() {
    UserListModel userListModel = UserListModel(userList: [
      UserList(
          ratings: 4,
          shopName: "AAAA",
          shopOpenAt: "10 AM",
          shopClosesAt: "10 PM",
          isShopOpened: false),
      UserList(
          ratings: 4,
          shopName: "BBBB",
          shopOpenAt: "10 AM",
          shopClosesAt: "10 PM",
          isShopOpened: true),
      UserList(
          ratings: 2,
          shopName: "CCCC",
          shopOpenAt: "10 AM",
          shopClosesAt: "10 PM",
          isShopOpened: true),
      UserList(
          ratings: 5,
          shopName: "DDDD",
          shopOpenAt: "10 AM",
          shopClosesAt: "10 PM",
          isShopOpened: true),
      UserList(
          ratings: 3,
          shopName: "EEEE",
          shopOpenAt: "10 AM",
          shopClosesAt: "10 PM",
          isShopOpened: false),
      UserList(
          ratings: 4,
          shopName: "FFFF",
          shopOpenAt: "10 AM",
          shopClosesAt: "10 PM",
          isShopOpened: false),
      UserList(
          ratings: 3,
          shopName: "GGGG",
          shopOpenAt: "10 AM",
          shopClosesAt: "10 PM",
          isShopOpened: true),
    ]);
    return Stream.value(userListModel);
  }
}
