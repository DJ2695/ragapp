import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/mixins/form_spacing.dart';
import 'package:ragapp_frontend/mixins/loaders.dart';
import 'package:ragapp_frontend/widgets/expandable_section.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AgentConfig extends StatelessWidget with FormSpacing {
  const AgentConfig({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      name: 'agent-config',
      title: 'Agent Config',
      description: 'Config tools and agent',
      child: Column(
        children: [
          ShadCheckboxFormField(
            id: "web-search",
            inputLabel: const Text("Web Search"),
            inputSublabel: const Text(
                "Search more information about a topic from the query using DuckDuckGo."),
            initialValue: false,
          ),
          formSpacing()
        ],
      ),
    );
  }
}
