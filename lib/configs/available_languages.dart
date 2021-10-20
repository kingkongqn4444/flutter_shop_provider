import 'package:flutter/material.dart';
import 'package:novus_trade_v1/models/seting_items.dart';

enum AvailableLanguage { ENGLISH, VIETNAM, FRANCE }

/// Represent the available languages our app supports
class LanguageSetting extends SettingSelectionItem {
  AvailableLanguage language;

  LanguageSetting(this.language);

  String getDisplayName(BuildContext context) {
    switch (language) {
      case AvailableLanguage.ENGLISH:
        return "English (en)";
      case AvailableLanguage.VIETNAM:
        return "Việt Nam (vn)";
      case AvailableLanguage.FRANCE:
        return "France (fr)";
      default:
        return "Việt Nam (vi)";
    }
  }

  String getLocaleString() {
    switch (language) {
      case AvailableLanguage.ENGLISH:
        return "en";
      case AvailableLanguage.VIETNAM:
        return "vi";
      case AvailableLanguage.FRANCE:
        return "fr";
      default:
        return "DEFAULT";
    }
  }

  String getLogo() {
    switch (language) {
      case AvailableLanguage.ENGLISH:
        return "img/images/us.png";
      case AvailableLanguage.VIETNAM:
        return "img/images/vietnam.png";
      case AvailableLanguage.FRANCE:
        return "img/images/frane.png";
      default:
        return "img/images/vietnam.png";
    }
  }

  Locale getLocale() {
    String localeStr = getLocaleString();
    if (localeStr == 'DEFAULT') {
      return Locale('en');
    }
    return Locale(localeStr);
  }

  // For saving to shared prefs
  String getId() {
    return language.toString();
  }
}
