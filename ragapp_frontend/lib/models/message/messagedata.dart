import 'package:freezed_annotation/freezed_annotation.dart';

part 'messagedata.freezed.dart';
part 'messagedata.g.dart';

@freezed
class MessageData with _$MessageData {
  factory MessageData(String id, String content, Map metadata) = _MessageData;

  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);
}
