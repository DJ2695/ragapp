import 'package:flutter/material.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class CodeHighlighterService {
  CodeHighlighterService._(HighlighterTheme theme) : _theme = theme;

  static CodeHighlighterService? _instance;
  final HighlighterTheme _theme;

  static Map<String, String> supported = {
    "dart": "dart",
    "yaml": "yaml",
    "sql": "sql",
    //"python": "ragapp_frontend/assets/grammar/python"
  }; //['dart', 'yaml', 'sql', 'python', 'json'];

  static Future<CodeHighlighterService> getInstance() async {
    if (_instance == null) {
      await Highlighter.initialize(supported.values.toList());
      final theme = await HighlighterTheme.loadDarkTheme();
      _instance = CodeHighlighterService._(theme);
    }
    return _instance!;
  }

  Highlighter _highlighter(String language) {
    var lang_key = language;
    if (!supported.keys.contains(lang_key)) lang_key = 'dart';
    final String lang_val = supported[lang_key]!;
    return Highlighter(language: lang_val, theme: _theme);
  }

  TextSpan highlight(String language, String code) {
    return _highlighter(language).highlight(code);
  }
}
