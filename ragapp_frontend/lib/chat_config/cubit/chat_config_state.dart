part of 'chat_config_cubit.dart';

@immutable
sealed class ChatConfigState {}

final class ChatConfigInitial extends ChatConfigState {}

final class ChatConfigLoading extends ChatConfigState {}

final class ChatConfigLoaded extends ChatConfigState {
  ChatConfigLoaded(this.config);

  final Map config;
}

final class ChatConfigError extends ChatConfigState {
  ChatConfigError(this.error);

  final String error;
}
