import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/mixins/loaders.dart';
import 'package:ragapp_frontend/widgets/expandable_section.dart';
import 'package:ragapp_frontend/widgets/multi_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ModelConfig extends StatelessWidget {
  const ModelConfig({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      name: "model-config",
      title: "Model Config",
      description: "Change to a different model or use another provider",
      child: Column(
        children: [
          ShadInputFormField(
            id: 'prompt',
            label: const Text('Custom Prompt'),
            minLines: 3,
            maxLines: 3,
            // placeholder: const Text('Enter your username'),
            description: const Text(
                'Use system prompt to define the responsibilities and behaviors of the assistant.'),
            validator: (v) {
              if (v.length < 2) {
                return 'Username must be at least 2 characters.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
