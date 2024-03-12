import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'kn', 'ml', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? knText = '',
    String? mlText = '',
    String? hiText = '',
  }) =>
      [enText, knText, mlText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '7yvhy971': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
    },
    'zdtytwwg': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
    },
  },
  // Jobs
  {
    '3tbu0yg5': {
      'en': 'Jobs',
      'hi': 'नौकरियां',
      'kn': 'ಉದ್ಯೋಗಗಳು',
      'ml': 'ജോലികൾ',
    },
  },
  // Languageselector
  {
    'r9u7rnqg': {
      'en': 'Please select your language',
      'hi': 'कृपया अपनी भाषा चुनें',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ദയവായി നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക',
    },
    'bn68wiu1': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': 'आइए नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
      'ml': 'ചുവടെയുള്ള ഫോം പൂരിപ്പിച്ച് നമുക്ക് ആരംഭിക്കാം.',
    },
    'y903j15i': {
      'en': 'Next ',
      'hi': 'अगला',
      'kn': 'ಮುಂದೆ',
      'ml': 'അടുത്തത്',
    },
    'vtjiex3i': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
    },
    'bsmhf93u': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
    },
  },
  // details
  {
    'riooicff': {
      'en': 'Job Description',
      'hi': 'नौकरी का विवरण',
      'kn': 'ಕೆಲಸದ ವಿವರ',
      'ml': 'ജോലി വിവരണം',
    },
    '18filj1z': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
    },
    'uymux4wy': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
    },
  },
  // postcategorydetails
  {
    '2mu60vg5': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
    },
    'u1varafg': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
    },
  },
  // postdetails
  {
    'tjzfmbe5': {
      'en': 'Job Description',
      'hi': 'नौकरी का विवरण',
      'kn': 'ಕೆಲಸದ ವಿವರ',
      'ml': 'ജോലി വിവരണം',
    },
    '3xe7nf3w': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
    },
    '576y2qa7': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'ml': '',
    },
  },
  // Miscellaneous
  {
    'j7kso0jc': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'khur4ndx': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    '3xn2f2a0': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'jr3diqge': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'iejc8o0m': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'g71tc9k9': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'umnenstj': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'z5x52pe0': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'y7mjlwij': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'qa0i7jtx': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'ca6xpx57': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    '860zf8z1': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'rtg3c1ro': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'elkny02g': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'odkwimtk': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    '6a40w6lj': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'ldcez5y2': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'falzgosr': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'xd4ufszn': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'vh13ds8s': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'fi9zsd35': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    '4kqkp6y7': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'f4yaz339': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'y69rfjf1': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
    'vgqfcihg': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
    },
  },
].reduce((a, b) => a..addAll(b));
