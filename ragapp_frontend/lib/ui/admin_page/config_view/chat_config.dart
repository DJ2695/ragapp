import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/bloc/chat_config/cubit/chat_config_cubit.dart';
import 'package:ragapp_frontend/mixins/form_spacing.dart';
import 'package:ragapp_frontend/mixins/loaders.dart';
import 'package:ragapp_frontend/widgets/expandable_section.dart';
import 'package:ragapp_frontend/widgets/multi_input.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ChatConfigSection extends StatelessWidget with FormSpacing, Loaders {
  ChatConfigSection({
    super.key,
  });

  final formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      name: "chat-config",
      title: "Chat Config",
      icon: Icon(LucideIcons.messageCircle),
      description: "Config how the chatbot behaves and interacts with the user",
      child: BlocBuilder<ChatConfigCubit, ChatConfigState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatConfigLoading:
              return circularLoader();
            case ChatConfigError:
              state as ChatConfigError;
              return errorAlert(state.error);
            case ChatConfigLoaded:
              state as ChatConfigLoaded;
              return ShadForm(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShadInputFormField(
                      id: 'prompt',
                      label: const Text('Custom Prompt'),
                      initialValue: state.chatConfig.customPrompt,
                      onChanged: (s) => state.chatConfig.customPrompt = s,
                      minLines: 3,
                      maxLines: 3,
                      // placeholder: const Text('Enter your username'),
                      description: const Text(
                          'Use system prompt to define the responsibilities and behaviors of the assistant.'),
                      // validator: (v) {
                      //   if (v.length < 2) {
                      //     return 'Username must be at least 2 characters.';
                      //   }
                      //   return null;
                      // },
                    ),
                    formSpacing(),
                    ShadFormBuilderField(
                        label: const Text('Conversation questions'),
                        description: const Text(
                            "Add suggested questions to help users start a conversation with the app."),
                        builder: (s) => MultiInput(
                              onChanged: (vs) =>
                                  state.chatConfig.conversationStarters = vs,
                              initialValues:
                                  state.chatConfig.conversationStarters ?? [''],
                            )),
                    formSpacing(),
                    ShadButton(
                      text: const Text('Submit'),
                      onPressed: () {
                        if (formKey.currentState!.saveAndValidate()) {
                          context
                              .read<ChatConfigCubit>()
                              .updateChatConfig(state.chatConfig);
                        } else {
                          print('validation failed');
                        }
                      },
                    ),
                    formSpacing()
                  ],
                ),
              );
            default:
              return const Text("No state found");
          }
        },
      ),
    );
  }
}
