import 'package:flutter_example/features/UserList/domain/entity/user_list_entity.dart';

class UserListModel extends UserListEntity {
  List<UserList> userList;
  UserListModel({required this.userList}) : super(userListData: userList);

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    UserListModel userListModel = UserListModel(userList: json["user_list"]);

    return userListModel;
  }

  Map<String, dynamic> toJson() => {
        "user_list": List<UserList>.from(userList.map((x) => x.toJson())),
      };
}

class UserList extends UserListData {
  String shopName;
  int ratings;
  String shopOpenAt;
  String shopClosesAt;
  bool isShopOpened;

  UserList(
      {required this.shopName,
      required this.ratings,
      required this.shopOpenAt,
      required this.shopClosesAt,required this.isShopOpened})
      : super(
            ratings: ratings,
            shopName: shopName,
            shopOpenAt: shopOpenAt,
            shopClosesAt: shopClosesAt,isShopOpened:isShopOpened);

  factory UserList.fromJson(Map<String, dynamic> json) {
    UserList userList = UserList(
        shopName: json["shop-name"],
        ratings: json["ratings"],
        shopOpenAt: json["opens-at"],
        shopClosesAt: json["closes-at"],
        isShopOpened:json["is_shop_opened"]
        );

    return userList;
  }

  Map<String, dynamic> toJson() => {
        "shop-name": shopName,
        "ratings": ratings,
        "opens-at": shopOpenAt,
        "closes-at": shopClosesAt,
        "is_shop_opened":isShopOpened
      };
}
