import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/bloc/chat_config/cubit/chat_config_cubit.dart';
import 'package:ragapp_frontend/l10n/l10n.dart';
import 'package:ragapp_frontend/mixins/form_spacing.dart';
import 'package:ragapp_frontend/ui/admin_page/chat_view/chat_section.dart';
import 'package:ragapp_frontend/ui/admin_page/config_view/agent_config.dart';
import 'package:ragapp_frontend/ui/admin_page/config_view/knowledge_config.dart';
import 'package:ragapp_frontend/ui/admin_page/config_view/model_config.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'config_view/chat_config.dart';

class AdminPage extends StatefulWidget with FormSpacing {
  const AdminPage({super.key});

  static ScrollController _scrollController = ScrollController();

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.constrain(MediaQuery.of(context).size);
            return ShadResizablePanelGroup(
              height: size.height,
              showHandle: false,
              children: [
                ShadResizablePanel(
                  defaultSize: size.width * .5,
                  minSize: size.width * 1 / 3,
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) => ChatConfigCubit(),
                      ),
                    ],
                    child: Scrollbar(
                      controller: AdminPage._scrollController,
                      child: ListView(
                        controller: AdminPage._scrollController,
                        padding: EdgeInsets.only(right: 15),
                        children: [
                          ModelConfig(),
                          ChatConfig(),
                          AgentConfig(),
                          KnowledgeConfig()
                        ],
                      ),
                    ),
                  ),
                ),
                ShadResizablePanel(
                    defaultSize: size.width * .5,
                    minSize: size.width * 1 / 3,
                    child: SizedBox.expand(child: ChatSection())),
              ],
            );
          },
        ),
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => context.read<ChatConfigCubit>().read(),
      //       child: const Icon(Icons.add),
      //     ),
      //     const SizedBox(height: 8),
      //     FloatingActionButton(
      //       onPressed: () => print("Sad"),
      //       child: const Icon(Icons.remove),
      //     ),
      //   ],
      // ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ChatConfigState state =
        context.select((ChatConfigCubit cubit) => cubit.state);

    String data = "no data";
    if (state.runtimeType == ChatConfigLoaded) {
      data = (state as ChatConfigLoaded).config.toString();
    }

    return Text(data, style: theme.textTheme.displaySmall);
  }
}
