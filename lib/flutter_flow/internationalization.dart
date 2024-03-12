import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'kn', 'ml', 'hi', 'te'];

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
    String? teText = '',
  }) =>
      [enText, knText, mlText, hiText, teText][languageIndex] ?? '';

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
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    's0so0tff': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    'c8luio9y': {
      'en': 'by practicepedia',
      'hi': 'प्रैक्टिसपीडिया द्वारा',
      'kn': 'ಅಭ್ಯಾಸಪೀಡಿಯಾದಿಂದ',
      'ml': 'പ്രാക്ടീസ് പീഡിയ വഴി',
      'te': 'ప్రాక్టీస్పీడియా ద్వారా',
    },
    'rptbpd10': {
      'en': 'Alert me',
      'hi': 'मुझे सतर्क करो',
      'kn': 'ನನ್ನನ್ನು ಎಚ್ಚರಿಸು',
      'ml': 'എന്നെ അറിയിക്കൂ',
      'te': 'నన్ను హెచ్చరించు',
    },
    'bp6l9xgr': {
      'en': 'Rate us',
      'hi': 'हमें रेटिंग दें',
      'kn': 'ನಮಗೆ ರೇಟ್ ಮಾಡಿ',
      'ml': 'ഞങ്ങളെ റേറ്റുചെയ്യുക',
      'te': 'మాకు రేట్ చేయండి',
    },
    '3j5gzjai': {
      'en': 'Interview preparation',
      'hi': 'साक्षात्कार की तैयारी',
      'kn': 'ಸಂದರ್ಶನದ ತಯಾರಿ',
      'ml': 'അഭിമുഖം തയ്യാറാക്കൽ',
      'te': 'ఇంటర్వ్యూ తయారీ',
    },
    'mybjhwqx': {
      'en': 'Exit',
      'hi': 'बाहर निकलना',
      'kn': 'ನಿರ್ಗಮಿಸಿ',
      'ml': 'പുറത്ത്',
      'te': 'బయటకి దారి',
    },
    'zdtytwwg': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // Jobs
  {
    '8pplxghl': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    '3tbu0yg5': {
      'en': 'Explore',
      'hi': 'अन्वेषण करना',
      'kn': 'ಅನ್ವೇಷಿಸಿ',
      'ml': 'പര്യവേക്ഷണം ചെയ്യുക',
      'te': 'అన్వేషించండి',
    },
  },
  // Languageselector
  {
    'r9u7rnqg': {
      'en': 'Please select your language',
      'hi': 'कृपया अपनी भाषा चुनें',
      'kn': 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ദയവായി നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക',
      'te': 'దయచేసి మీ భాషను ఎంచుకోండి',
    },
    'bn68wiu1': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': 'आइए नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
      'kn': 'ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡುವ ಮೂಲಕ ಪ್ರಾರಂಭಿಸೋಣ.',
      'ml': 'ചുവടെയുള്ള ഫോം പൂരിപ്പിച്ച് നമുക്ക് ആരംഭിക്കാം.',
      'te': 'దిగువ ఫారమ్‌ను పూరించడం ద్వారా ప్రారంభిద్దాం.',
    },
    'y903j15i': {
      'en': 'Next ',
      'hi': 'अगला',
      'kn': 'ಮುಂದೆ',
      'ml': 'അടുത്തത്',
      'te': 'తరువాత',
    },
    'vtjiex3i': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    'bsmhf93u': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // details
  {
    'riooicff': {
      'en': 'Job Description',
      'hi': 'नौकरी का विवरण',
      'kn': 'ಕೆಲಸದ ವಿವರ',
      'ml': 'ജോലി വിവരണം',
      'te': 'ఉద్యోగ వివరణ',
    },
    'cqn3fdrc': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    'uymux4wy': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // postcategorydetails
  {
    '1i3tp15i': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    'u1varafg': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // postdetails
  {
    'tjzfmbe5': {
      'en': 'Job Description',
      'hi': 'नौकरी का विवरण',
      'kn': 'ಕೆಲಸದ ವಿವರ',
      'ml': 'ജോലി വിവരണം',
      'te': 'ఉద్యోగ వివరణ',
    },
    'tzp1li28': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    '576y2qa7': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // job_search
  {
    '9n8lqvxe': {
      'en': 'Search for jobs...',
      'hi': 'जॉब के लिए खोजें...',
      'kn': 'ಉದ್ಯೋಗಗಳಿಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ജോലികൾക്കായി തിരയുക...',
      'te': 'ఉద్యోగాల కోసం వెతకండి...',
    },
    '2ykk9q2m': {
      'en': 'Post',
      'hi': 'डाक',
      'kn': 'ಪೋಸ್ಟ್ ಮಾಡಿ',
      'ml': 'പോസ്റ്റ്',
      'te': 'పోస్ట్ చేయండి',
    },
    '6v8jqptb': {
      'en': 'Jobs',
      'hi': 'नौकरियां',
      'kn': 'ಉದ್ಯೋಗಗಳು',
      'ml': 'ജോലികൾ',
      'te': 'ఉద్యోగాలు',
    },
    '1voi07y3': {
      'en': 'Choose',
      'hi': 'चुनना',
      'kn': 'ಆಯ್ಕೆ ಮಾಡಿ',
      'ml': 'തിരഞ്ഞെടുക്കുക',
      'te': 'ఎంచుకోండి',
    },
    'h8f7gxjn': {
      'en': 'Search for an item...',
      'hi': 'कोई आइटम खोजें...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'te': 'ఒక వస్తువు కోసం శోధించండి...',
    },
    'vcve1mdp': {
      'en': 'Search',
      'hi': 'खोज',
      'kn': 'ಹುಡುಕಿ Kannada',
      'ml': 'തിരയുക',
      'te': 'వెతకండి',
    },
    'dkti2kz6': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    'z7jfnxtn': {
      'en': 'Jobs',
      'hi': 'नौकरियां',
      'kn': 'ಉದ್ಯೋಗಗಳು',
      'ml': 'ജോലികൾ',
      'te': 'ఉద్యోగాలు',
    },
  },
  // job_search_details
  {
    'dknkombi': {
      'en': 'Job Description',
      'hi': 'नौकरी का विवरण',
      'kn': 'ಕೆಲಸದ ವಿವರ',
      'ml': 'ജോലി വിവരണം',
      'te': 'ఉద్యోగ వివరణ',
    },
    'lmb0g6y5': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    'isbe4nes': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // postsearchdetails
  {
    '5f9apxql': {
      'en': 'Job Description',
      'hi': 'नौकरी का विवरण',
      'kn': 'ಕೆಲಸದ ವಿವರ',
      'ml': 'ജോലി വിവരണം',
      'te': 'ఉద్యోగ వివరణ',
    },
    '9hq6yykw': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    '0ioq359k': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // emailalert
  {
    'w0yltchj': {
      'en': 'Email Alert',
      'hi': 'ईमेल अलर्ट',
      'kn': 'ಇಮೇಲ್ ಎಚ್ಚರಿಕೆ',
      'ml': 'ഇമെയിൽ അലേർട്ട്',
      'te': 'ఇమెయిల్ హెచ్చరిక',
    },
    '0syvmz4s': {
      'en': 'Please enter your email address to get latest job alerts',
      'hi':
          'नवीनतम जॉब अलर्ट प्राप्त करने के लिए कृपया अपना ईमेल पता दर्ज करें',
      'kn':
          'ಇತ್ತೀಚಿನ ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳನ್ನು ಪಡೆಯಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇಮೇಲ್ ವಿಳಾಸವನ್ನು ನಮೂದಿಸಿ',
      'ml':
          'ഏറ്റവും പുതിയ തൊഴിൽ അലേർട്ടുകൾ ലഭിക്കുന്നതിന് ദയവായി നിങ്ങളുടെ ഇമെയിൽ വിലാസം നൽകുക',
      'te':
          'తాజా ఉద్యోగ హెచ్చరికలను పొందడానికి దయచేసి మీ ఇమెయిల్ చిరునామాను నమోదు చేయండి',
    },
    'hb1dp7zf': {
      'en': 'Job Alerts',
      'hi': 'नौकरी अलर्ट',
      'kn': 'ಉದ್ಯೋಗ ಎಚ್ಚರಿಕೆಗಳು',
      'ml': 'ജോലി അലേർട്ടുകൾ',
      'te': 'ఉద్యోగ హెచ్చరికలు',
    },
    'l67aig8r': {
      'en': 'Home',
      'hi': 'घर',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'te': 'హోమ్',
    },
  },
  // Miscellaneous
  {
    'j7kso0jc': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'khur4ndx': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    '3xn2f2a0': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'jr3diqge': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'iejc8o0m': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'g71tc9k9': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'umnenstj': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'z5x52pe0': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'y7mjlwij': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'qa0i7jtx': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'ca6xpx57': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    '860zf8z1': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'rtg3c1ro': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'elkny02g': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'odkwimtk': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    '6a40w6lj': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'ldcez5y2': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'falzgosr': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'xd4ufszn': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'vh13ds8s': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'fi9zsd35': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    '4kqkp6y7': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'f4yaz339': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'y69rfjf1': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
    'vgqfcihg': {
      'en': '',
      'hi': '',
      'kn': '',
      'ml': '',
      'te': '',
    },
  },
].reduce((a, b) => a..addAll(b));
