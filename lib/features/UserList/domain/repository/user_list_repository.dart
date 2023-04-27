import 'package:dartz/dartz.dart';
import 'package:flutter_example/features/UserList/domain/entity/user_list_entity.dart';

import '../usecase/user_list_usecase.dart';

abstract class UserListRepository {
  Stream<Either<Failure, UserListEntity>> fetchUserList();
}
