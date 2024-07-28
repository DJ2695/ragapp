import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'stepmodel.freezed.dart';
part 'stepmodel.g.dart';

@freezed
class StepModel with _$StepModel {
  // Added constructor. Must not have any parameter
  const StepModel._();

  factory StepModel(String caption, String type) = _StepModel;

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);

  IconData get icon {
    switch (type.toLowerCase()) {
      case "retriever":
        return LucideIcons.database;
      case "embedding":
        return LucideIcons.chartScatter;
      case "tool":
        return LucideIcons.hammer;
      case "llm":
        return Icons.chat_outlined;
      default:
        return LucideIcons.moveRight;
    }
  }
}
