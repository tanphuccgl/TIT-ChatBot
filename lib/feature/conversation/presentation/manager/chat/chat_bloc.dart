import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tit_chat_bot/core/config/const.dart';
import 'package:tit_chat_bot/core/error/failures.dart';
import 'package:tit_chat_bot/core/usecase/usecase.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';
import 'package:tit_chat_bot/feature/conversation/domain/usecase/chat.dart';
import 'package:tit_chat_bot/feature/conversation/domain/usecase/get_chat.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_event.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_state.dart';


class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final PostChat postChat;
  final GetCurrentChat getCurrentChat;

  ChatBloc({PostChat? lg, GetCurrentChat? cu})
      : assert(lg != null),
        assert(cu != null),
        getCurrentChat = cu!,
        postChat = lg!,
        super(Empty());

  ChatState get initialState => Empty();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is IsChat) {
      yield Loading();
      final result = await getCurrentChat(NoParams());
      yield* _eitherChatOrErrorState(result);
    }
    if (event is ChatE) {
     yield Loading();
      final result =
      await postChat(ChatParams(message:  event.message, sender:  event.sender));

      yield* _eitherLoadedOrErrorState(result);
    }
    if (event is ClearE) {
      yield Empty();
    }
  }

  Stream<ChatState> _eitherLoadedOrErrorState(
      Either<Failure, List<ChatData>> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (res) => Loaded(data: res),
    );
  }

  Stream<ChatState> _eitherChatOrErrorState(
      Either<Failure, List<ChatData>> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
          (failure) => NotChat(),
          (res) => ChatAlready(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
