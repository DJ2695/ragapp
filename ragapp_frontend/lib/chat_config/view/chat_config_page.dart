import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragapp_frontend/chat_config/cubit/chat_config_cubit.dart';
import 'package:ragapp_frontend/counter/counter.dart';
import 'package:ragapp_frontend/l10n/l10n.dart';

class ChatConfigPage extends StatelessWidget {
  const ChatConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatConfigCubit(),
      child: const ChatConfigView(),
    );
  }
}

class ChatConfigView extends StatelessWidget {
  const ChatConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
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
