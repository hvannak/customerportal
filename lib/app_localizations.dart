// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AppLocalizations {
//   final Locale locale;
//   AppLocalizations(this.locale);
//   static const LocalizationsDelegate<AppLocalizations> delegate =
//       _AppLocalizationsDelegate();
//   static AppLocalizations of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations);
//   }
//   Map<String, String> _localizedStrings;
//   Future<bool> load() async {
//     String jsonString =
//         await rootBundle.loadString('lang/${locale.languageCode}.json');
//     Map<String, dynamic> jsonMap = json.decode(jsonString);

//     _localizedStrings = jsonMap.map((key, value) {
//       return MapEntry(key, value.toString());
//     });

//     return true;
//   }
//   String translate(String key) {
//     return _localizedStrings[key];
//   }
// }

// class _AppLocalizationsDelegate
//     extends LocalizationsDelegate<AppLocalizations> {
  
//   const _AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     return ['en', 'km'].contains(locale.languageCode);
    
//   }

//   @override
//   Future<AppLocalizations> load(Locale locale) async { 
//     AppLocalizations localizations = new AppLocalizations(locale);
//     await localizations.load();
//     print("Load language ${locale.languageCode}");  
//     return localizations;
//   }

//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppLocalizations {
  Locale locale;
  static Map<dynamic, dynamic> _localisedValues;

  AppLocalizations(Locale locale) {
    this.locale = locale;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appTranslations = AppLocalizations(locale);
    String jsonContent =
    await rootBundle.loadString('lang/${locale.languageCode}.json');
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String translate(String key) {
    return _localisedValues[key] ?? "$key not found";
  }
}
