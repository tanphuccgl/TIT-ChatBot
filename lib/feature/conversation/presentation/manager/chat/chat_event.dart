import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ChatEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ChatE extends ChatEvent {
  final String sender;
  final String message;

  ChatE(this.sender, this.message);
  @override
  // TODO: implement props
  List<Object> get props => [sender, message];
}

class ClearE extends ChatEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IsChat extends ChatEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
