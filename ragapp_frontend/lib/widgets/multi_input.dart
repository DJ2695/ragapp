import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MultiInput extends StatefulWidget {
  MultiInput(
      {this.initialValues = const [''],
      this.onChanged,
      this.onDelete,
      super.key});
  final List<String> initialValues;
  void Function(List<String>)? onChanged;
  void Function()? onDelete;

  @override
  State<MultiInput> createState() => _MultiInputState();
}

class _MultiInputState extends State<MultiInput> {
  late List<String> values;

  @override
  void initState() {
    values = widget.initialValues;
    super.initState();
  }

  void handleInputChange(String newValue, int index) {
    setState(() {
      List<String> newValues = List.from(values);
      newValues[index] = newValue;
      if (index == values.length - 1 && newValue.isNotEmpty) {
        newValues.add("");
      }
      widget.onChanged?.call(newValues);
      values = newValues;
    });
  }

  void handleInputKeyDown(KeyEvent event, int index) {
    if (event.logicalKey == LogicalKeyboardKey.enter &&
        values[index].trim().isNotEmpty) {
      if (index == values.length - 1) {
        setState(() {
          values.add("");
        });
      }
    } else if (event.logicalKey == LogicalKeyboardKey.backspace &&
        values[index].isEmpty &&
        values.length > 1) {
      setState(() {
        values.removeAt(index);
      });
    }
    widget.onChanged?.call(values);
  }

  void handleDeleteInput(int index) {
    setState(() {
      values.removeAt(index);
      if (values.isEmpty) {
        values.add("");
      }
    });
    widget.onChanged?.call(values);
    widget.onDelete?.call();
    // onDelete callback can be handled here if needed
  }

  Widget get_input(int index, String text) {
    final FocusNode _focusNode = FocusNode();
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (ke) => handleInputKeyDown(ke, index),
      child: ShadInputFormField(
        initialValue: text,
        onChanged: (txt) => handleInputChange(txt, index),
        suffix: ShadButton.outline(
          width: 24,
          height: 24,
          padding: EdgeInsets.zero,
          decoration: const ShadDecoration(
            secondaryBorder: ShadBorder.none,
            secondaryFocusedBorder: ShadBorder.none,
          ),
          icon: const Icon(
            size: 16,
            LucideIcons.x,
          ),
          onTapDown: (_) => handleDeleteInput(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: values.mapIndexed(get_input).toList(),
    );
  }
}
