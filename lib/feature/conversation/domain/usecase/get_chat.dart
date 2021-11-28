import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/error/failures.dart';
import 'package:tit_chat_bot/core/usecase/usecase.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';
import 'package:tit_chat_bot/feature/conversation/domain/repo/chat_repo.dart';

class GetCurrentChat implements UseCase<List<ChatData>, NoParams> {
  final ChatRepository? chatRepository;

  GetCurrentChat({@required this.chatRepository});
  @override
  Future<Either<Failure, List<ChatData>>> call(NoParams params) async {
    return await chatRepository!.getCurrentChat();
  }
}
