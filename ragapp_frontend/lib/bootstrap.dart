import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:ragapp_frontend/services/code_highlighter_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/shared_preferences_service.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> setup() async {
  // Register SharedPreferencesService
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  getIt.registerSingleton<SharedPreferencesService>(sharedPreferencesService);

  // Register CodeHighlighterService
  final codeHighlighterService = await CodeHighlighterService.getInstance();
  getIt.registerSingleton<CodeHighlighterService>(codeHighlighterService);
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  await setup();

  runApp(await builder());
}