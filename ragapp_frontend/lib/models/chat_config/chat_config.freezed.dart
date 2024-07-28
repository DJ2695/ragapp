// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatConfig _$ChatConfigFromJson(Map<String, dynamic> json) {
  return _ChatConfig.fromJson(json);
}

/// @nodoc
mixin _$ChatConfig {
  String? get customPrompt => throw _privateConstructorUsedError;
  set customPrompt(String? value) => throw _privateConstructorUsedError;
  @JsonKey(fromJson: startersFromJson)
  List<String>? get conversationStarters => throw _privateConstructorUsedError;
  @JsonKey(fromJson: startersFromJson)
  set conversationStarters(List<String>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatConfigCopyWith<ChatConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatConfigCopyWith<$Res> {
  factory $ChatConfigCopyWith(
          ChatConfig value, $Res Function(ChatConfig) then) =
      _$ChatConfigCopyWithImpl<$Res, ChatConfig>;
  @useResult
  $Res call(
      {String? customPrompt,
      @JsonKey(fromJson: startersFromJson) List<String>? conversationStarters});
}

/// @nodoc
class _$ChatConfigCopyWithImpl<$Res, $Val extends ChatConfig>
    implements $ChatConfigCopyWith<$Res> {
  _$ChatConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customPrompt = freezed,
    Object? conversationStarters = freezed,
  }) {
    return _then(_value.copyWith(
      customPrompt: freezed == customPrompt
          ? _value.customPrompt
          : customPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      conversationStarters: freezed == conversationStarters
          ? _value.conversationStarters
          : conversationStarters // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatConfigImplCopyWith<$Res>
    implements $ChatConfigCopyWith<$Res> {
  factory _$$ChatConfigImplCopyWith(
          _$ChatConfigImpl value, $Res Function(_$ChatConfigImpl) then) =
      __$$ChatConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customPrompt,
      @JsonKey(fromJson: startersFromJson) List<String>? conversationStarters});
}

/// @nodoc
class __$$ChatConfigImplCopyWithImpl<$Res>
    extends _$ChatConfigCopyWithImpl<$Res, _$ChatConfigImpl>
    implements _$$ChatConfigImplCopyWith<$Res> {
  __$$ChatConfigImplCopyWithImpl(
      _$ChatConfigImpl _value, $Res Function(_$ChatConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customPrompt = freezed,
    Object? conversationStarters = freezed,
  }) {
    return _then(_$ChatConfigImpl(
      freezed == customPrompt
          ? _value.customPrompt
          : customPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == conversationStarters
          ? _value.conversationStarters
          : conversationStarters // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ChatConfigImpl implements _ChatConfig {
  _$ChatConfigImpl(this.customPrompt,
      @JsonKey(fromJson: startersFromJson) this.conversationStarters);

  factory _$ChatConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatConfigImplFromJson(json);

  @override
  String? customPrompt;
  @override
  @JsonKey(fromJson: startersFromJson)
  List<String>? conversationStarters;

  @override
  String toString() {
    return 'ChatConfig(customPrompt: $customPrompt, conversationStarters: $conversationStarters)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatConfigImplCopyWith<_$ChatConfigImpl> get copyWith =>
      __$$ChatConfigImplCopyWithImpl<_$ChatConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatConfigImplToJson(
      this,
    );
  }
}

abstract class _ChatConfig implements ChatConfig {
  factory _ChatConfig(
      String? customPrompt,
      @JsonKey(fromJson: startersFromJson)
      List<String>? conversationStarters) = _$ChatConfigImpl;

  factory _ChatConfig.fromJson(Map<String, dynamic> json) =
      _$ChatConfigImpl.fromJson;

  @override
  String? get customPrompt;
  set customPrompt(String? value);
  @override
  @JsonKey(fromJson: startersFromJson)
  List<String>? get conversationStarters;
  @JsonKey(fromJson: startersFromJson)
  set conversationStarters(List<String>? value);
  @override
  @JsonKey(ignore: true)
  _$$ChatConfigImplCopyWith<_$ChatConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
