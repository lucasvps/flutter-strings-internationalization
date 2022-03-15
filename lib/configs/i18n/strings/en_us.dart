// ignore_for_file: annotate_overrides

import 'package:flutter_strings_internationalization/configs/i18n/strings/translations.dart';

class EnUs implements ITranslations {
  @override
  String get appBarTitle => "String's Internationalization";
  String get currentLanguageText => "Current Language: ";
  String get clickDesiredLanguage =>
      "Click on the desired country flag to change the strings internationalization.";
  String get myFirsText => "My first text here to show on the screen";
  String get mySecondText => "My second text here to show on the screen";
  String get myThirdText => "My third text here to show on the screen";
}
