import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krungthai_next/utils/Languages/lang_en.dart';
import 'package:krungthai_next/utils/Languages/lang_th.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': LangEN.localizedValues,
        'th': LangTH.localizedValues,
      };

  Map<String, String> value(Map<String, String> localizedValues) {
    Map<String, String> data = localizedValues.map((key, String value) =>
        MapEntry(
            key,
            value
                .replaceAll("&amp;", "&")
                .replaceAll("&gt;", ">")
                .replaceAll("&lt;", "<")
                .replaceAll("&#8211;", "-")
                .replaceAll("\\'", "'")
                .replaceAll("'\"'", "\"/g")));
    return data;
  }

  static Set<LanguageModel> get langModel => {
        const LanguageEN(),
        const LanguageTH(),
      };

  static const String argValue1 = "arg1";
  static const String argValue2 = "arg2";
  static const String argValue3 = "arg3";
}

@immutable
abstract class LanguageModel {
  final String langName;
  final Locale locale;

  const LanguageModel(this.langName, this.locale);
}

@immutable
class LanguageEN extends LanguageModel {
  const LanguageEN() : super("English, US", const Locale("en", "US"));
}

@immutable
class LanguageTH extends LanguageModel {
  const LanguageTH() : super("ไทย", const Locale("th", "TH"));
}
