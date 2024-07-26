import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/bloc/chat_config/cubit/chat_config_cubit.dart';
import 'package:ragapp_frontend/l10n/l10n.dart';
import 'package:ragapp_frontend/ui/admin_page/widgets/agent_config.dart';
import 'package:ragapp_frontend/ui/admin_page/widgets/knowledge_config.dart';
import 'package:ragapp_frontend/ui/admin_page/widgets/model_config.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'widgets/chat_config.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  static ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Container(
        child: ShadResizablePanelGroup(
          axis: Axis.horizontal,
          height: size.height,
          showHandle: true,
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
                  controller: _scrollController,
                  child: ListView(
                    controller: _scrollController,
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
                child: Container()),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<ChatConfigCubit>().read(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => print("Sad"),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
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
