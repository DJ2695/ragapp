import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/mixins/form_spacing.dart';
import 'package:ragapp_frontend/mixins/loaders.dart';
import 'package:ragapp_frontend/ui/admin_page/widgets/model_providers/ollama.dart';
import 'package:ragapp_frontend/widgets/expandable_section.dart';
import 'package:ragapp_frontend/widgets/multi_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KnowledgeConfig extends StatefulWidget {
  const KnowledgeConfig({
    super.key,
  });

  static List<String> modelProviders = ['Ollama', 'AzureOpenAI'];

  @override
  State<KnowledgeConfig> createState() => _KnowledgeConfigState();
}

class _KnowledgeConfigState extends State<KnowledgeConfig> with FormSpacing {
  Widget? modelProvider;

  Widget? getModelProvider(String? v) {
    if (v == "Ollama") {
      return OllamaForm();
    }
  }

  @override
  void initState() {
    modelProvider =
        getModelProvider(KnowledgeConfig.modelProviders.firstOrNull);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      name: 'knowledge-config',
      title: 'Knowledge Config',
      description: 'Manage your own data to chat with.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShadSwitchFormField(
            initialValue: false,
            label: const Text("Use LLama Cloud"),
          ),
          formSpacing(),
          Divider(),
          formSpacing(),
          ShadButton(
            text: const Text('Upload Files'),
            onPressed: () {
              // if (formKey.currentState!.saveAndValidate()) {
              //   print(
              //       'validation succeeded with ${formKey.currentState!.value}');
              // } else {
              //   print('validation failed');
              // }
            },
          ),
          formSpacing(),
          Divider(),
          formSpacing(),
          ShadCheckboxFormField(
              inputLabel: const Text('Use Llama Parse'),
              inputSublabel:
                  const Text('Use LLamaParse to efficiently parse files'),
              initialValue: false),
          formSpacing(),
        ],
      ),
    );
  }
}
