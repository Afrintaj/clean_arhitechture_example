import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example/features/UserList/domain/entity/user_list_entity.dart';
import 'package:flutter_example/features/UserList/domain/repository/user_list_repository.dart';

abstract class UseCase<Type, T> {
  Stream<Either<Failure, Type>> call(T params);
}

abstract class Failure {
  @override
  List<Object> get props => [];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class UserListUsecase extends UseCase<UserListEntity, NoParams> {
  late UserListRepository userListRepository;
  UserListUsecase(this.userListRepository);
  @override
  Stream<Either<Failure, UserListEntity>> call(NoParams params) {
    return userListRepository.fetchUserList();
  }
}
