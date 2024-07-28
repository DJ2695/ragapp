import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:markdown_widget/widget/all.dart';
import 'package:ragapp_frontend/bootstrap.dart';
import 'package:ragapp_frontend/models/step/stepmodel.dart';
import 'package:ragapp_frontend/services/code_highlighter_service.dart';
import 'package:ragapp_frontend/ui/admin_page/chat_view/widgets/avatar.dart';
import 'package:ragapp_frontend/ui/admin_page/chat_view/widgets/steps.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class Message extends StatelessWidget {
  const Message(
      {required this.message,
      required this.icon,
      this.iconColor,
      super.key,
      this.isLast,
      this.preText,
      this.postText});
  final String message;
  final Icon icon;
  final bool? isLast;
  final Widget? preText, postText;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Avatar(
                icon: icon,
                color: iconColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (preText != null) preText!,
                      TexMarkdown(
                        message,
                        style: theme.textTheme.list,
                      ),
                      if (postText != null) postText!
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!(isLast ?? false))
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            )
        ],
      ),
    );
  }
}

class AIMessage extends StatelessWidget {
  const AIMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = ShadTheme.of(context).avatarTheme.size!;
    return Message(
      message: """Hi, how can I help you?\nHere is some code:\n
            ```python
            if hello:
              print(true);
            ```
Did you like it?
            """,
      preText: Steps(
        steps: [
          StepModel("Retrieved 5 Docs.", "retriever"),
          StepModel("Idk.", "llm"),
          StepModel("Idk.", "embedding"),
          StepModel("Idk.", "llm"),
        ],
      ),
      icon: Icon(LucideIcons.bot),
      iconColor: Colors.green,
    );
  }
}

class UserMessage extends StatelessWidget {
  const UserMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Message(
      message: "Hi,",
      icon: Icon(LucideIcons.user),
      iconColor: Colors.indigo,
      isLast: true,
    );
  }
}
