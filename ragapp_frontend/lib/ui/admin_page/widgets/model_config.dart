import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/mixins/form_spacing.dart';
import 'package:ragapp_frontend/mixins/loaders.dart';
import 'package:ragapp_frontend/ui/admin_page/widgets/model_providers/ollama.dart';
import 'package:ragapp_frontend/widgets/expandable_section.dart';
import 'package:ragapp_frontend/widgets/multi_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ModelConfig extends StatefulWidget {
  const ModelConfig({
    super.key,
  });

  static List<String> modelProviders = ['Ollama', 'AzureOpenAI'];

  @override
  State<ModelConfig> createState() => _ModelConfigState();
}

class _ModelConfigState extends State<ModelConfig> with FormSpacing {
  Widget? modelProvider;

  Widget? getModelProvider(String? v) {
    if (v == "Ollama") {
      return OllamaForm();
    }
  }

  @override
  void initState() {
    modelProvider = getModelProvider(ModelConfig.modelProviders.firstOrNull);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      name: 'model-config',
      title: 'Model Config',
      description: 'Change to a different model or use another provider',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShadSelectFormField<String>(
            id: 'model-providers',
            initialValue: ModelConfig.modelProviders.firstOrNull,
            onChanged: (v) {
              setState(() {
                modelProvider = getModelProvider(v);
              });
            },
            options: ModelConfig.modelProviders
                .map((mp) => ShadOption(value: mp, child: Text(mp)))
                .toList(),
            selectedOptionBuilder: (context, value) => value == 'none'
                ? const Text('Select a model provider')
                : Text(value),
            placeholder: const Text('Select a model provider'),
            validator: (v) {
              if (v == null) {
                return 'Please select a model provider.';
              }
              return null;
            },
          ),
          if (modelProvider != null) ...[
            formSpacing(),
            modelProvider!,
          ],
          formSpacing(),
          ShadButton(
            text: const Text('Submit'),
            onPressed: () {
              // if (formKey.currentState!.saveAndValidate()) {
              //   print(
              //       'validation succeeded with ${formKey.currentState!.value}');
              // } else {
              //   print('validation failed');
              // }
            },
          ),
        ],
      ),
    );
  }
}
