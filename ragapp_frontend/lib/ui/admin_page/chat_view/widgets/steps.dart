import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ragapp_frontend/models/step/stepmodel.dart';
import 'package:ragapp_frontend/widgets/block_quote.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Steps extends StatefulWidget {
  const Steps({required this.steps, super.key});
  final List<StepModel> steps;

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  final ExpandableController expandableController = ExpandableController();
  final expandableTheme =
      ExpandableThemeData(useInkWell: false, hasIcon: false);

  bool get expanded => expandableController.value;
  set expanded(bool v) => expandableController.value = v;

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;

    return ExpandablePanel(
      controller: expandableController,
      theme: expandableTheme,
      collapsed: const SizedBox.shrink(),
      header: BlockQuote(
        child: Row(
          children: [
            SizedBox(
              width: 45.sp,
              child: ShadButton.outline(
                //padding: EdgeInsets.zero,
                text: Expanded(
                  child: Text("${expanded ? "Hide" : "Show"} 5 Steps"),
                ),
                icon: Icon(
                  LucideIcons.chevronDown,
                ),
                onTapDown: (_) => setState(() {
                  expanded = !expanded;
                }),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      expanded: BlockQuote(
        child: Column(
          children: widget.steps
              .map(
                (s) => ListTile(
                  dense: true,
                  leading: Icon(s.icon),
                  title: Text(
                    s.caption,
                    style: textTheme.small,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
