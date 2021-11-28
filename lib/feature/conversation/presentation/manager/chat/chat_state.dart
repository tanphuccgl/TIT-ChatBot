import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';

@immutable
abstract class ChatState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends ChatState {}

class Loading extends ChatState {}

class Loaded extends ChatState {
  final List<ChatData> data;
  Loaded({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class Error extends ChatState {
  final String message;
  Error({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class ChatAlready extends ChatState {}

class NotChat extends ChatState {}
