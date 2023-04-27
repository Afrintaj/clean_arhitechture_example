import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserListEntity {
  List<UserListData> userListData;
  UserListEntity({required this.userListData});
}

class UserListData {
  String shopName;
  int ratings;
  String shopOpenAt;
  String shopClosesAt;
  bool isShopOpened;

  UserListData(
      {required this.shopName,
      required this.ratings,
      required this.shopOpenAt,
      required this.shopClosesAt,
      required this.isShopOpened});
}
