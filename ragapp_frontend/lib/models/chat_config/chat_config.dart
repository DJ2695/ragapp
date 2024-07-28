import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_config.freezed.dart';
part 'chat_config.g.dart';

List<String>? startersFromJson(dynamic value) {
  if (value is List) return value.map((v) => v as String).toList();
  if (value is String) return [value];
  return null;
}

@unfreezed
class ChatConfig with _$ChatConfig {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory ChatConfig(
      String? customPrompt,
      @JsonKey(
        fromJson: startersFromJson,
      )
      List<String>? conversationStarters) = _ChatConfig;

  factory ChatConfig.fromJson(Map<String, dynamic> json) =>
      _$ChatConfigFromJson(json);
}
