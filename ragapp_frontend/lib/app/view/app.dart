import 'package:flutter/material.dart';
import 'package:ragapp_frontend/chat_config/view/chat_config_page.dart';
import 'package:ragapp_frontend/counter/counter.dart';
import 'package:ragapp_frontend/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ChatConfigPage(),
    );
  }
}
