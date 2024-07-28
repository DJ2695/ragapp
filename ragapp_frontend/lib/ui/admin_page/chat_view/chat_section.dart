import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:ragapp_frontend/ui/admin_page/chat_view/widgets/chat_input.dart';
import 'package:ragapp_frontend/ui/admin_page/chat_view/widgets/messages.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ChatSection extends StatefulWidget {
  const ChatSection({super.key});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  final _user = const types.User(
    firstName: "Hans",
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );
  final _user2 = const types.User(
    firstName: "Jürgen",
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ab',
  );

  final List<types.Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.insert(
        0,
        types.TextMessage(
            id: "1",
            author: _user,
            text: "Hi",
            createdAt: DateTime.now().millisecondsSinceEpoch));
    _messages.insert(
        1,
        types.TextMessage(
            id: "2",
            author: _user2,
            text: "Hi",
            createdAt: DateTime.now().millisecondsSinceEpoch));
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final ChatTheme chatTheme = DefaultChatTheme(
        primaryColor: colorScheme.primary,
        backgroundColor: colorScheme.background,
        inputTextColor: colorScheme.input,
        sendButtonIcon: const Icon(LucideIcons.send),
        sendingIcon: const Icon(LucideIcons.send));

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          ListView(
            children: [AIMessage(), UserMessage()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatInput(),
          )
        ],
      ),
      // child: Chat(
      //   theme: chatTheme,
      //   messages: _messages,
      //   onSendPressed: (partialText) {
      //     print(partialText.text);
      //   },
      //   showUserAvatars: true,
      //   showUserNames: true,
      //   user: _user,
      //   avatarBuilder: (author) {
      //     final theme = ShadTheme.of(context);
      //     final size = theme.avatarTheme.size!;
      //     return Container(
      //       width: size.width,
      //       height: size.height,
      //       clipBehavior: Clip.antiAlias,
      //       alignment: Alignment.center,
      //       decoration: ShapeDecoration(
      //         shape: theme.avatarTheme.shape!,
      //         color: theme.avatarTheme.backgroundColor,
      //       ),
      //       child: Text(author.firstName!.substring(0, 1)),
      //     );
      //   },
      //   messageWidthRatio: 0.9,
      //   bubbleBuilder: (child,
      //           {required message, required nextMessageInGroup}) =>
      //       Container(
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(15), color: Colors.white),
      //     child: child,
      //   ),
      //   textMessageBuilder: (m,
      //       {required messageWidth, required showName}) {
      //     return Container(
      //       child: Text(
      //         m.toString(),
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
