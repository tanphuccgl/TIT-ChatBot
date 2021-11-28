import 'package:dartz/dartz.dart';
import 'package:tit_chat_bot/core/error/exceptions.dart';
import 'package:tit_chat_bot/core/error/failures.dart';
import 'package:tit_chat_bot/core/network/network_info.dart';
import 'package:tit_chat_bot/feature/conversation/data/data_source/chat_local.dart';
import 'package:tit_chat_bot/feature/conversation/data/data_source/chat_remote.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';
import 'package:tit_chat_bot/feature/conversation/domain/repo/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final NetworkInfo networkInfo;
  final ChatLocalDataSource chatLocalDataSource;
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl(
      {required this.networkInfo,
        required this.chatLocalDataSource,
        required this.chatRemoteDataSource});

  @override
  Future<Either<Failure, List<ChatData>>> getCurrentChat() {
    return _getChat();
  }

  @override
  Future<Either<Failure, List<ChatData>>> postChat(String sender, String message) {
    return _chat(chatRemoteDataSource.chat(sender, message));
  }

  Future<Either<Failure, List<ChatData>>> _getChat() async {
    try {
      final result = await chatLocalDataSource.getChat();
      return Right(result);
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<ChatData>>> _chat(Future<List<ChatData>> chatInfo) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await chatInfo;
        chatLocalDataSource.saveChat(result);
        _getChat();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
