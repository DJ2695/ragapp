import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:ragapp_frontend/models/chat_config/chat_config.dart';
import 'package:ragapp_frontend/repositories/chat_config_repo.dart';
part 'chat_config_state.dart';

class ChatConfigCubit extends Cubit<ChatConfigState> {
  ChatConfigCubit() : super(ChatConfigLoading()) {
    getChatConfig();
  }

  final chatConfigRepository = ChatConfigRepository();

  Future getChatConfig() async {
    emit(ChatConfigLoading());
    final response = await chatConfigRepository.getChatConfig();
    response.fold(
      (e) => emit(ChatConfigError(e.toString())),
      (chatConfig) => emit(ChatConfigLoaded(chatConfig)),
    );
  }

  Future updateChatConfig(ChatConfig chatConfig) async {
    final response = await chatConfigRepository.updateChatConfig(chatConfig);
    response.fold(
      (e) => emit(ChatConfigError(e.toString())),
      (c) => emit(ChatConfigLoaded(c ?? chatConfig)),
    );
  }
}
