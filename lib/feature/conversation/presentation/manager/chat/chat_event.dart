import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatE extends ChatEvent {
  final String sender;
  final String message;
  final Function() failure;
  ChatE(this.sender, this.message,{required this.failure,});
  @override
  List<Object> get props => [sender, message];
}

class ClearE extends ChatEvent {
  @override
  List<Object> get props => [];
}

class IsChat extends ChatEvent {
  @override
  List<Object> get props => [];
}
