// ignore_for_file: constant_identifier_names

class LanguagesManager {
  static const Arabic = 'ar';
  static const English = 'en';
  static const Hindi = 'hi';
  static const Urdu = 'ur';
  static const appLanguages = [Arabic, English, Hindi, Urdu];

  static String getLanguageText(String code) {
    switch (code) {
      case Arabic:
        return 'العربية';

      case English:
        return 'English';

      case Hindi:
        return 'हिन्दी';

      case Urdu:
        return 'اردو';
      default:
        return '';
    }
  }
}
