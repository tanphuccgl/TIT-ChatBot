// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tit_chat_bot/core/network/network_info.dart';
import 'package:tit_chat_bot/feature/conversation/data/data_source/chat_local.dart';
import 'package:tit_chat_bot/feature/conversation/data/data_source/chat_remote.dart';
import 'package:tit_chat_bot/feature/conversation/data/repo/chat_repo_impl.dart';
import 'package:tit_chat_bot/feature/conversation/domain/repo/chat_repo.dart';
import 'package:tit_chat_bot/feature/conversation/domain/usecase/chat.dart';
import 'package:tit_chat_bot/feature/conversation/domain/usecase/get_chat.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  ///
  //Chat
  sl.registerFactory(
    () => ChatBloc(
      lg: sl(),
      cu: sl(),
    ),
  );

  ///use case
  //Chat
  sl.registerLazySingleton(() => PostChat(chatRepository: sl()));
  sl.registerLazySingleton(() => GetCurrentChat(chatRepository: sl()));

  ///repo
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
      networkInfo: sl(),
      chatLocalDataSource: sl(),
      chatRemoteDataSource: sl()));

  ///data source
  //Chat
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSourceImpl(sharedPreferences: sl()));

  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
