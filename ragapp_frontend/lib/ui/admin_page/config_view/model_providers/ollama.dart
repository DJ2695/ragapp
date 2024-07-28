import 'package:flutter/widgets.dart';
import 'package:ragapp_frontend/mixins/form_spacing.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Ollama extends StatefulWidget {
  const Ollama({required this.formKey, super.key});
  final GlobalKey<ShadFormState> formKey;

  @override
  State<Ollama> createState() => _OllamaState();
}

class _OllamaState extends State<Ollama> with FormSpacing {
  static List<String> embeddingModels = ['nomic-embed-text'];

  Future<List<String>> fetchModels(String type, String baseUrl) async {
    // Implement the API call logic here
    // For now, we'll just return a dummy list
    await Future.delayed(Duration(seconds: 1));
    return ['model1', 'model2', 'model3'];
  }

  Future<List<String>> fetchOllamaModels() {
    String? ollamaBaseUrl = 'ollama_base_url';
    if (ollamaBaseUrl != null && ollamaBaseUrl.isNotEmpty) {
      return fetchModels('ollama', ollamaBaseUrl);
    } else {
      return Future.value([]);
    }
  }

  List<String> getLLMModels(List<String> models) {
    return models.where((model) {
      final modelName = model.split(':')[0];
      return !embeddingModels.contains(modelName);
    }).toList();
  }

  List<String> getEmbeddingModels(List<String> models) {
    return models.where((model) {
      final modelName = model.split(':')[0];
      return embeddingModels.contains(modelName);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadInputFormField(
          id: 'base-url',
          label: const Text('Ollama Base URL'),
          description: const Text(
              'Set to http://host.docker.internal:11434 if you are running Ollama locally'),
        ),
        formSpacing(),
        ShadInputFormField(
          id: 'request-timeout',
          label: const Text('Request timeout'),
          description: const Text('Timeout in seconds for Ollama API requests'),
          keyboardType: TextInputType.number,
        ),
        formSpacing(),
        ShadSelectFormField<String>(
          id: 'model',
          initialValue: embeddingModels.firstOrNull,
          onChanged: (v) {},
          options: embeddingModels
              .map((email) => ShadOption(value: email, child: Text(email)))
              .toList(),
          selectedOptionBuilder: (context, value) => value == 'none'
              ? const Text('Select a verified email to display')
              : Text(value),
          placeholder: const Text('Select a verified email to display'),
          validator: (v) {
            if (v == null) {
              return 'Please select an email to display';
            }
            return null;
          },
        ),
        formSpacing()
      ],
    );
  }
}
