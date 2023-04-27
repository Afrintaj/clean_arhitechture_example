import 'package:flutter_example/features/UserList/data/datasource/user_list_remote_src.dart';
import 'package:flutter_example/features/UserList/data/datasource/user_list_remote_src_impl.dart';
import 'package:flutter_example/features/UserList/data/repository/user_list_repository_impl.dart';
import 'package:flutter_example/features/UserList/domain/repository/user_list_repository.dart';
import 'package:flutter_example/features/UserList/domain/usecase/user_list_usecase.dart';
import 'package:flutter_example/features/UserList/presentation/bloc/bloc/user_list_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // blocs
  sl.registerFactory(() => UserListBloc(sl()));

  // usecases
  sl.registerLazySingleton(() => UserListUsecase(sl()));

  // repository
  sl.registerLazySingleton<UserListRepository>(
      () => UserListRepositoryImpl(sl()));

  // datasource
  sl.registerLazySingleton<UserListRemoteSrc>(() => UserListRemoteSrcImpl());
}
