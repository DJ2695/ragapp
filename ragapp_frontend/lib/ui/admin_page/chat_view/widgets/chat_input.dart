import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController(text: "");
  bool enabled = false;
  final FocusNode _focusNode = FocusNode();
  String get text => _controller.value.text;
  final size = 24.0;

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      //onKeyEvent: (ke) => handleInputKeyDown(ke, index),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ShadInput(
              autofocus: true,
              controller: _controller,
              onChanged: (value) => setState(() {
                enabled = text.isNotEmpty;
              }),
              suffix: ShadButton.outline(
                enabled: enabled,
                width: size,
                height: size,
                padding: EdgeInsets.zero,
                decoration: const ShadDecoration(
                  secondaryBorder: ShadBorder.none,
                  secondaryFocusedBorder: ShadBorder.none,
                ),
                icon: Icon(
                  size: size,
                  LucideIcons.send,
                ),
                //onTapDown: (_) => handleDeleteInput(index),
              ),
            ),
          ),
          ShadButton.outline(
            size: ShadButtonSize.sm,
            icon: const Icon(
              LucideIcons.paperclip,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
