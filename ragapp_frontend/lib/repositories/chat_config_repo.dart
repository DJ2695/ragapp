import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ragapp_frontend/models/chat_config/chat_config.dart';
import 'package:ragapp_frontend/repositories/api/client.dart';

class ChatConfigRepository {
  final subBaseUrl = "/management/config";
  final apiClient = ApiClient();

  Future<Either<Exception, ChatConfig>> getChatConfig() async {
    final response =
        await apiClient.get<Map<String, dynamic>>("$subBaseUrl/chat");
    return response.fold(Left.new, (data) => Right(ChatConfig.fromJson(data)));
  }

  Future<Either<Exception, ChatConfig?>> updateChatConfig(
      ChatConfig newConfig) async {
    final response = await apiClient.post<Map<String, dynamic>?>(
        '$subBaseUrl/chat', newConfig.toJson());
    return response.fold(
        Left.new,
        (data) =>
            Right(data != null ? ChatConfig.fromJson(data["data"]) : null));
  }
}
