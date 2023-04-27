import 'package:dio/dio.dart';
import 'package:flutter_example/core/failures.dart';
import 'package:flutter_example/features/UserList/data/datasource/user_list_remote_src.dart';
import 'package:flutter_example/features/UserList/domain/entity/user_list_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_example/features/UserList/domain/repository/user_list_repository.dart';
import 'package:flutter_example/features/UserList/domain/usecase/user_list_usecase.dart';

class UserListRepositoryImpl implements UserListRepository {
  UserListRemoteSrc userListRemoteSrc;
  UserListRepositoryImpl(this.userListRemoteSrc);
  @override
  Stream<Either<Failure, UserListEntity>> fetchUserList() async* {
    try {
      var response = await userListRemoteSrc.fetchUserList().single;
      if (response is DioError) {
        yield Left(FailureMessage("error msg"));
      } else {
        yield Right(response);
      }
    } catch (e, s) {
      print("dio error $e");
      if (e is DioError) {
        if (e.response!.statusCode == 401) {
          yield Left(FailureMessage("Authentication error"));
        }
      } else {
        Failure error = await checkErrorState(e, s);
        yield Left(error);
      }
    }
  }
}

Future<Failure> checkErrorState(e, StackTrace s) async {
  print(e);
  return FailureMessage("Something went wrong!");
}
