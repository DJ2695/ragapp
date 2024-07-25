import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OllamaForm extends StatefulWidget {
  const OllamaForm({super.key});

  @override
  State<OllamaForm> createState() => _OllamaFormState();
}

class _OllamaFormState extends State<OllamaForm> {
  final formKey = GlobalKey<ShadFormState>();

  const List<String> embeddingModels = ["nomic-embed-text"];

  Future<List<String>> fetchModels(String type, String baseUrl) async {
    // Implement the API call logic here
    // For now, we'll just return a dummy list
    await Future.delayed(Duration(seconds: 1));
    return ["model1", "model2", "model3"];
  }

  Future<List<String>> fetchOllamaModels() {
    String? ollamaBaseUrl = widget.form["ollama_base_url"];
    if (ollamaBaseUrl != null && ollamaBaseUrl.isNotEmpty) {
      return fetchModels("ollama", ollamaBaseUrl);
    } else {
      return Future.value([]);
    }
  }

  List<String> getLLMModels(List<String> models) {
    return models.where((model) {
      final modelName = model.split(":")[0];
      return !embeddingModels.contains(modelName);
    }).toList();
  }

  List<String> getEmbeddingModels(List<String> models) {
    return models.where((model) {
      final modelName = model.split(":")[0];
      return embeddingModels.contains(modelName);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ShadForm(
        key: formKey,
        child: Column(
          children: [
            ShadInputFormField(
              label: const Text("Ollama Base URL"),
              description: const Text(
                  "Set to http://host.docker.internal:11434 if you are running Ollama locally"),
            ),
            ShadInputFormField(
              label: const Text("Request timeout"),
              description:
                  const Text("Timeout in seconds for Ollama API requests"),
              keyboardType: TextInputType.number,
            ),
            ShadFormBuilderField(
                label: const Text('Conversation questions'),
                description: const Text(
                    "Add suggested questions to help users start a conversation with the app."),
                builder: (state) => Container()),
          ],
        ));
  }
}
