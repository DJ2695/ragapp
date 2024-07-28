import 'package:flutter/material.dart';
import 'package:ragapp_frontend/l10n/l10n.dart';
import 'package:ragapp_frontend/ui/admin_page/admin_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const ShadApp(
          // theme: ThemeData(
          //   appBarTheme: AppBarTheme(
          //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   ),
          //   useMaterial3: true,
          // ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: AdminPage(),
        );
      },
    );
  }
}
