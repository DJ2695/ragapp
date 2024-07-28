import 'package:dio/dio.dart';

class DataProvider {
  final Dio _dio = Dio();
  final String baseUrl = 'http://your_fastapi_backend_url';

  Future<bool?> isConfigured() async {
    final response = await _dio.get<bool>('$baseUrl/is_configured');
    return response.data;
  }

  Future<Map<String, dynamic>?> getChatConfig() async {
    final response = await _dio.get<Map<String, dynamic>>('$baseUrl/chat');
    return response.data;
  }

  Future<Map<String, dynamic>?> updateChatConfig(
      Map<String, dynamic> newConfig) async {
    final response =
        await _dio.post<Map<String, dynamic>>('$baseUrl/chat', data: newConfig);
    return response.data;
  }

  Future<Map<String, dynamic>?> getModelConfig() async {
    final response = await _dio.get<Map<String, dynamic>>('$baseUrl/models');
    return response.data;
  }

  Future<Map<String, dynamic>?> updateModelConfig(
      Map<String, dynamic> newConfig) async {
    final response = await _dio.post<Map<String, dynamic>>('$baseUrl/models',
        data: newConfig);
    return response.data;
  }

  Future<List<String>> getAvailableModels(
      {String? provider, String? providerUrl}) async {
    final queryParameters = {
      'provider': provider,
      'provider_url': providerUrl,
    };
    final response = await _dio.get<List<String>>('$baseUrl/models/list',
        queryParameters: queryParameters);
    return List<String>.from(response.data ?? []);
  }
}
