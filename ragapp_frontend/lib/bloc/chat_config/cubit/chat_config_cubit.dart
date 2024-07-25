import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
part 'chat_config_state.dart';

class ChatConfigCubit extends Cubit<ChatConfigState> {
  ChatConfigCubit() : super(ChatConfigInitial()) {
    _dio = Dio();
  }
  final String apiUrl =
      'http://localhost:8000/api/management/config/chat'; // Replace with your actual API URL
  late Dio _dio;

  Future read() async {
    emit(ChatConfigLoading());
    try {
      final response = await _dio.request(this.apiUrl);

      if (response.statusCode == 200) {
        // Optionally handle the response from the backend if needed
        final data = response.data;
        Map config = data as Map;
        emit(ChatConfigLoaded(config));
      } else {
        emit(ChatConfigError('Failed to send message'));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        emit(ChatConfigError(e.message!));
      }
    }
  }
}
