import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ragapp_frontend/bootstrap.dart';
import 'package:ragapp_frontend/services/shared_preferences_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ExpandableSection extends StatefulWidget {
  const ExpandableSection({
    required this.name,
    required this.title,
    required this.child,
    this.description,
    this.isLoading,
    this.icon,
    super.key,
  });
  final String name;
  final String title;
  final Widget child;
  final String? description;
  final bool? isLoading;
  final Icon? icon;

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  final sharedPreferences = getIt.get<SharedPreferencesService>();

  final ExpandableController expandableController = ExpandableController();

  bool get expanded => expandableController.value;
  set expanded(bool v) => expandableController.value = v;

  @override
  void initState() {
    super.initState();
    expanded = sharedPreferences.getBool(widget.name) ?? false;
    expandableController.addListener(_storePreference);
  }

  void _storePreference() {
    sharedPreferences.setBool(widget.name, expanded);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final expandableTheme =
        ExpandableThemeData(useInkWell: false, iconColor: colorScheme.primary);

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ShadCard(
          border: Border.all(color: Colors.grey.shade400),
          radius: BorderRadius.circular(12),
          content: ExpandablePanel(
            controller: expandableController,
            theme: expandableTheme,
            header: GestureDetector(
              onTap: expandableController.toggle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (widget.icon != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: widget.icon,
                        ),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: ShadTheme.of(context).textTheme.h4,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7.5),
                    child: const Divider(
                      height: 1.5,
                    ),
                  ),
                  if (widget.description != null)
                    Text(
                      widget.description!,
                      style: ShadTheme.of(context)
                          .textTheme
                          .list
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            collapsed: const SizedBox.shrink(),
            expanded: Container(
              padding: const EdgeInsets.only(left: 10),
              child: widget.child,
            ),
          )
          //),
          ),
    );
  }
}