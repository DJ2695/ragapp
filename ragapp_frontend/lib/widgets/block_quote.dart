import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BlockQuote extends StatelessWidget {
  const BlockQuote({required this.child, super.key, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              color: color ?? theme.colorScheme.primary,
              width: 2,
            ),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
