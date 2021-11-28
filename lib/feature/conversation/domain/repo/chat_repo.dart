import 'package:dartz/dartz.dart';
import 'package:tit_chat_bot/core/error/failures.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatData>>> postChat(String sender, String message);
  Future<Either<Failure, List<ChatData>>> getCurrentChat();
}
