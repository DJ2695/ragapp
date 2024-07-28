import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.icon, this.color});
  final Icon icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = Size.square(34); //theme.avatarTheme.size!;
    final _color = color ?? ShadTheme.of(context).colorScheme.primary;
    return ShadButton(
      // height: size.height,
      // width: size.width,
      padding: EdgeInsets.zero,
      icon: icon,
      gradient: LinearGradient(colors: [
        _color.withOpacity(0.4),
        _color,
      ]),
      shadows: [
        BoxShadow(
          color: _color.withOpacity(.2),
          spreadRadius: 4,
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
      onPressed: () => null,
    );
    // return Container(
    //   width: size.width,
    //   height: size.height,
    //   clipBehavior: Clip.antiAlias,
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     color: color,
    //   ),
    //   child: icon,
    // );
  }
}
