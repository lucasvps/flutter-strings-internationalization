// ignore_for_file: annotate_overrides

import 'package:flutter_strings_internationalization/configs/i18n/strings/translations.dart';

class PtBr implements ITranslations {
  @override
  String get appBarTitle => "Internacionalização de Strings";
  String get currentLanguageText => "Linguagem atual: ";
  String get clickDesiredLanguage =>
      "Clique na bandeira do país desejado para alterar a internacionalização dos textos.";
  String get myFirsText => "Meu primeiro texto aqui para mostrar na tela";
  String get mySecondText => "Meu segundo texto aqui para mostrar na tela";
  String get myThirdText => "Meu terceiro texto aqui para mostrar na tela";
}
