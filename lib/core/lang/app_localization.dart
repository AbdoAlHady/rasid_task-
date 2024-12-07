import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  Locale? locale;

  AppLocalization({this.locale});

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  late Map<String, String> _jsonStrings;

  static LocalizationsDelegate<AppLocalization> delegate =
      const _AppLocalizationDelegate();

  Future<void> loadJsonLanguage() async {
    String strings =
        await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');
    Map<String, dynamic> jsons = jsonDecode(strings);
    _jsonStrings = jsons.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _jsonStrings[key] ?? "";
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale: locale);
    await localization.loadJsonLanguage();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
