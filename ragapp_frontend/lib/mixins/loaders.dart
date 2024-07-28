import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

mixin Loaders {
  Widget circularLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget errorAlert(String msg) {
    return ShadAlert(
      iconSrc: LucideIcons.info,
      title: const Text('Error'),
      description: Text(msg),
    );
  }
}
