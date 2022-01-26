import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/error/failures.dart';
import 'package:tit_chat_bot/core/usecase/usecase.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';
import 'package:tit_chat_bot/feature/conversation/domain/repo/chat_repo.dart';

class PostChat implements UseCase<List<ChatData>, ChatParams> {
  final ChatRepository? chatRepository;

  PostChat({@required this.chatRepository});

  @override
  Future<Either<Failure, List<ChatData>>> call(ChatParams params) async {
    return await chatRepository!.postChat(params.sender!, params.message!);
  }
}

class ChatParams extends Equatable {
  final String? sender;
  final String? message;

  const ChatParams({@required this.sender, @required this.message});

  @override
  List<Object> get props => [sender!, message!];
}
