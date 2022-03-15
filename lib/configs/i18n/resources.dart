import 'package:flutter/widgets.dart';
import 'package:flutter_strings_internationalization/configs/i18n/strings/en_us.dart';
import 'package:flutter_strings_internationalization/configs/i18n/strings/es_es.dart';
import 'package:flutter_strings_internationalization/configs/i18n/strings/pt_br.dart';

import './strings/translations.dart';

class R {
  static ITranslations value = PtBr();

  static void load(Locale locale) {
    switch (locale.toString()) {
      case 'en_US':
        value = EnUs();
        break;
      case 'pt_BR':
        value = PtBr();
        break;
      case 'es_ES':
        value = EsEs();
        break;
      default:
        value = PtBr();
        break;
    }
  }

  static String languageFlag(Locale locale) {
    switch (locale.toString()) {
      case 'en_US':
        return "assets/images/eua.png";
      case 'pt_BR':
        return "assets/images/brasil.png";
      case 'es_ES':
        return "assets/images/espanha.png";
      default:
        return "assets/images/brasil.png";
    }
  }
}
