part of 'chat_config_cubit.dart';

@immutable
sealed class ChatConfigState {}

final class ChatConfigLoading extends ChatConfigState {}

final class ChatConfigLoaded extends ChatConfigState {
  ChatConfigLoaded(this.chatConfig);

  final ChatConfig chatConfig;
}

final class ChatConfigError extends ChatConfigState {
  ChatConfigError(this.error);

  final String error;
}
