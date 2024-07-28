// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatConfigImpl _$$ChatConfigImplFromJson(Map<String, dynamic> json) =>
    _$ChatConfigImpl(
      json['custom_prompt'] as String?,
      startersFromJson(json['conversation_starters']),
    );

Map<String, dynamic> _$$ChatConfigImplToJson(_$ChatConfigImpl instance) =>
    <String, dynamic>{
      'custom_prompt': instance.customPrompt,
      'conversation_starters': instance.conversationStarters,
    };
