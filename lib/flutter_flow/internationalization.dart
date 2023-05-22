import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'fr'];

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
    String? arText = '',
    String? frText = '',
  }) =>
      [enText, arText, frText][languageIndex] ?? '';

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
  // Login
  {
    '0k3f0426': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'fr': 'Adresse e-mail',
    },
    'q7x3zzr3': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'fr': 'Adresse e-mail',
    },
    'kjp5dtwi': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    'isx3no8d': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    '8ps4al4s': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
      'fr': 'Connexion',
    },
    'v0cvvgc5': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'gvop6uo8': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
    },
    '8z60xgf7': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'fr': 'Mot de passe oublié?',
    },
    'l0hs5on7': {
      'en': 'Continue as Guest',
      'ar': 'تواصل كضيف',
      'fr': 'Continuer en tant qu\'invité',
    },
    'prupzzgf': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // Register
  {
    'xecjhieh': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'fr': 'Adresse e-mail',
    },
    '41s2640s': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'fr': 'Adresse e-mail',
    },
    '8v26twb8': {
      'en': 'Choose Password',
      'ar': 'إختر كلمة السر',
      'fr': 'Choisissez un mot de passe',
    },
    'bcg9tyjd': {
      'en': 'Choose Password',
      'ar': 'إختر كلمة السر',
      'fr': 'Choisissez un mot de passe',
    },
    '7a4f6bc1': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'fr': 'Confirmez le mot de passe',
    },
    'su8k0n6c': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'fr': 'Confirmez le mot de passe',
    },
    'cd3l2kg4': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
    },
    'vh1u92bu': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'fr': 'Vous avez déjà un compte?',
    },
    'ygw0s6y8': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': 'Connexion',
    },
    'madgzaji': {
      'en': 'Continue as Guest',
      'ar': 'تواصل كضيف',
      'fr': 'Continuer en tant qu\'invité',
    },
    'g84dgeei': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // STSUser
  {
    'yvr7zij1': {
      'en': 'STS User',
      'ar': 'مستخدم STS',
      'fr': 'Utilisateur STS',
    },
    'cr28hhcs': {
      'en': 'My Friends',
      'ar': 'أصدقائي',
      'fr': 'Mes amis',
    },
  },
  // completeProfile
  {
    'hcyfog4l': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'fr': 'Profil complet',
    },
    '78jni3ln': {
      'en': 'Image URL',
      'ar': 'رابط الصورة',
      'fr': 'URL de l\'image',
    },
    'lz8778tw': {
      'en': 'Copy an avatar here...',
      'ar': 'انسخ صورة رمزية هنا ...',
      'fr': 'Copiez un avatar ici...',
    },
    'uhrheu0q': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'fr': 'votre nom',
    },
    '1frai56d': {
      'en': 'What name do you go by?',
      'ar': 'ما الاسم الذي تذهب به؟',
      'fr': 'Quel nom portez-vous?',
    },
    'bfsmp8oj': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'fr': 'Votre titre',
    },
    '2ejwxbcl': {
      'en': 'What do you do?',
      'ar': 'ماذا تفعل؟',
      'fr': 'Que fais-tu?',
    },
    '6ofhdol5': {
      'en': 'Save Profile',
      'ar': 'احفظ الملف',
      'fr': 'Enregistrer le profil',
    },
    'r2es37tn': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // forgotPassword
  {
    'n4vdqz8i': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'fr': 'Mot de passe oublié',
    },
    'hsxudsa3': {
      'en': 'Contact Your Administrator',
      'ar': 'تواصل مع مديرك',
      'fr': 'Contactez votre administrateur',
    },
    'sdb2e7k0': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // chatDetails
  {
    'jdb5t1ta': {
      'en': 'Job Title',
      'ar': 'مسمى وظيفي',
      'fr': 'Titre d\'emploi',
    },
    's5ylgt5w': {
      'en': 'Employed Since',
      'ar': 'تم توظيفه منذ',
      'fr': 'Employé depuis',
    },
    'yejwyxvm': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // home
  {
    'tsfsija8': {
      'en': 'All trips',
      'ar': 'كل الرحلات',
      'fr': 'Tous les voyages',
    },
    'zuk55wap': {
      'en': 'welcome ',
      'ar': 'مرحباً',
      'fr': 'accueillir',
    },
    'mmrhnr4l': {
      'en':
          'We hope you have a wonderful day ahead, filled with exciting travels and unforgettable experiences\n',
      'ar':
          'نأمل أن يكون أمامك يوم رائع ، مليء بالرحلات المثيرة والتجارب التي لا تُنسى',
      'fr':
          'Nous espérons que vous avez une merveilleuse journée à venir, remplie de voyages passionnants et d\'expériences inoubliables',
    },
    '2g5wdgmm': {
      'en': 'Travel  ',
      'ar': 'يسافر',
      'fr': 'Voyage',
    },
    's31zlp0n': {
      'en': ' Station',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'f7frbl30': {
      'en': 'STS User',
      'ar': 'مستخدم STS',
      'fr': 'Utilisateur STS',
    },
    '93ou7sys': {
      'en': 'Your your travel today ',
      'ar': 'سفرك اليوم',
      'fr': 'Votre voyage aujourd\'hui',
    },
    'l1qbjo9c': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'z9kepai7': {
      'en': 'Houssem eddine khoildi',
      'ar': 'حسام الدين خويلدي',
      'fr': 'Houssem eddine khoildi',
    },
    '65zpekpc': {
      'en': 'View',
      'ar': 'منظر',
      'fr': 'Voir',
    },
    '4mu592ts': {
      'en': 'home',
      'ar': 'بيت',
      'fr': 'maison',
    },
  },
  // changePassword
  {
    '23lwerp8': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'fr': 'Changer le mot de passe',
    },
    'jhrjg7dd': {
      'en': 'Your Email Address',
      'ar': 'عنوان بريدك  الإلكتروني',
      'fr': 'Votre adresse e-mail',
    },
    'zyqjrqqn': {
      'en': 'Please enter a email...',
      'ar': 'الرجاء إدخال بريد إلكتروني ...',
      'fr': 'Veuillez saisir un e-mail...',
    },
    'uifrbe5t': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'fr': 'Envoyer le lien de réinitialisation',
    },
    'f1xywm2d': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // myProfile
  {
    '3ae8ln6x': {
      'en': 'Switch to Dark Mode',
      'ar': 'قم بالتبديل إلى الوضع الداكن',
      'fr': 'Passer en mode sombre',
    },
    'cvrmphv2': {
      'en': 'Switch to Light Mode',
      'ar': 'قم بالتبديل إلى وضع الإضاءة',
      'fr': 'Passer en mode lumière',
    },
    'fnqiw8yj': {
      'en': 'Account Settings',
      'ar': 'إعدادت الحساب',
      'fr': 'Paramètres du compte',
    },
    'xx5xh1tx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
    },
    '34fxhxm0': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'fr': 'Changer le mot de passe',
    },
    'uixmuytl': {
      'en': 'About',
      'ar': 'تغيير كلمة المرور',
      'fr': 'Changer le mot de passe',
    },
    'xughzcrx': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    'a98nqfqx': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
  },
  // editProfile
  {
    'zssotgmx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
    },
    'zjrtbmgp': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'fr': 'Adresse e-mail',
    },
    '44dyxd4d': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'fr': 'Nom et prénom',
    },
    'uusj5147': {
      'en': 'Job Title',
      'ar': 'مسمى وظيفي',
      'fr': 'Titre d\'emploi',
    },
    'csp8bz3v': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Sauvegarder les modifications',
    },
    'k6poic1g': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // Station
  {
    '5hh367r0': {
      'en': 'Search for your ....',
      'ar': 'ابحث عن ....',
      'fr': 'Recherchez votre ....',
    },
    'o88a5xun': {
      'en': 'Mahdia',
      'ar': 'المهدية',
      'fr': 'Mahdia',
    },
    'vh30oaf7': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'kdgqzhgt': {
      'en': 'rte de Sousse 5160 El Jem - MAHDIA',
      'ar': 'rte de Sousse 5160 الجم - المهدية',
      'fr': 'rte de Sousse 5160 El Jem - MAHDIA',
    },
    '852ftkbr': {
      'en': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
      'ar': 'شارع ابن شرف 5100 المهدية - المهدية',
      'fr': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
    },
    '1w9m47no': {
      'en': 'Insert  Station',
      'ar': 'Insérer la Station',
      'fr': 'Insérer la Station',
    },
    'ngfp30a7': {
      'en': 'Inséert Line ',
      'ar': 'Insérer la ligne',
      'fr': 'Insérer la ligne',
    },
    'x9emwgcy': {
      'en': 'Sousse',
      'ar': 'سوسة',
      'fr': 'Sousse',
    },
    'k5smewh9': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'hx8cadr3': {
      'en': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
      'ar': 'شارع ليوبولد سنغور 4000 سوسة - سوسة',
      'fr': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
    },
    '4wyh2qyk': {
      'en': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'ar': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'fr': 'Avenue de la République 4030 Enfidha - SOUSSE',
    },
    'wrxxwkkc': {
      'en': 'Insert  Station',
      'ar': 'Insérer la Station',
      'fr': 'Insérer la Station',
    },
    'w1dp9w4k': {
      'en': 'Inséert Line ',
      'ar': 'Insérer la ligne',
      'fr': 'Insérer la ligne',
    },
    'l05qxef9': {
      'en': 'Monastir',
      'ar': 'المنستير',
      'fr': 'Monastir',
    },
    '25ohecyl': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    '7k38kph7': {
      'en': '\tBab Gharbi 5000 Monastir - MONASTIR',
      'ar': 'باب غربي 5000 المنستير - المنستير',
      'fr': 'Bab Gharbi 5000 Monastir - MONASTIR',
    },
    '1xtt34nf': {
      'en': '\tplace du 14 Janvier 5050 Moknine - MONASTIR',
      'ar': 'Place du 14 Janvier 5050 Moknine - MONASTIR',
      'fr': 'place du 14 Janvier 5050 Moknine - MONASTIR',
    },
    'f9eszu0f': {
      'en': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'ar': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'fr': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
    },
    'n7q4xygf': {
      'en': 'Insert  Station',
      'ar': 'Insérer la Station',
      'fr': 'Insérer la Station',
    },
    'f0rz0rhx': {
      'en': 'Inséert Line ',
      'ar': 'Insérer la ligne',
      'fr': 'Insérer la ligne',
    },
    'wmq9o5kl': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'nnjw5wyi': {
      'en': 'Shop',
      'ar': 'محل',
      'fr': 'Boutique',
    },
  },
  // maps
  {
    'mz2415f3': {
      'en': 'STS maps ',
      'ar': 'خرائط STS',
      'fr': 'Cartes STS',
    },
    'sanzbhsc': {
      'en': 'Select Location',
      'ar': 'اختر موقعا',
      'fr': 'Sélectionnez l\'emplacement',
    },
    'lltkvjl1': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'fr': 'Option 1',
    },
    'nyd2tfhy': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'pnx23kjb': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
      'fr': 'Veuillez sélectionner...',
    },
    '4efyte76': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
    },
    'zt8ry53i': {
      'en': 'start',
      'ar': 'يبدأ',
      'fr': 'commencer',
    },
    'd4z6gfog': {
      'en': 'souse  to ',
      'ar': 'تذوق ل',
      'fr': 'souse à',
    },
    'jk3ngiwc': {
      'en': 'Add station ',
      'ar': 'أضف المحطة',
      'fr': 'Ajouter une gare',
    },
    'k6ub36xm': {
      'en': 'Stop & save ',
      'ar': 'توقف وحفظ',
      'fr': 'Arrêtez et économisez',
    },
    '39jm7hxc': {
      'en': 'Quickly find templates',
      'ar': 'اعثر على القوالب بسرعة',
      'fr': 'Trouvez rapidement des modèles',
    },
    '98swr4bw': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // travel
  {
    'sh4jsmod': {
      'en': 'Search for your ....',
      'ar': 'ابحث عن ....',
      'fr': 'Recherchez votre ....',
    },
    'hqq688x7': {
      'en': 'Mahdia',
      'ar': 'المهدية',
      'fr': 'Mahdia',
    },
    'k9p6q7qk': {
      'en': 'travel',
      'ar': 'يسافر',
      'fr': 'voyage',
    },
    '571q6b3b': {
      'en': 'rte de Sousse 5160 El Jem - MAHDIA',
      'ar': 'rte de Sousse 5160 الجم - المهدية',
      'fr': 'rte de Sousse 5160 El Jem - MAHDIA',
    },
    '03jonypd': {
      'en': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
      'ar': 'شارع ابن شرف 5100 المهدية - المهدية',
      'fr': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
    },
    '7n2nrk4m': {
      'en': 'insert travel ',
      'ar': 'أدخل كلمة السفر',
      'fr': 'voyage d\'insertion',
    },
    'vwqrizqv': {
      'en': 'insert line ',
      'ar': 'أدخل السطر',
      'fr': 'insérer une ligne',
    },
    '57dn6gc1': {
      'en': 'Sousse',
      'ar': 'سوسة',
      'fr': 'Sousse',
    },
    'n30dctz9': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    '7bovy2t3': {
      'en': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
      'ar': 'شارع ليوبولد سنغور 4000 سوسة - سوسة',
      'fr': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
    },
    'm6og4je9': {
      'en': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'ar': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'fr': 'Avenue de la République 4030 Enfidha - SOUSSE',
    },
    'tkqmpbhk': {
      'en': 'Insérer la Station',
      'ar': 'Insérer la Station',
      'fr': 'Insérer la Station',
    },
    'i9l8mjvj': {
      'en': 'Insérer la ligne',
      'ar': 'Insérer la ligne',
      'fr': 'Insérer la ligne',
    },
    'qbj4zcbi': {
      'en': 'Monastir',
      'ar': 'المنستير',
      'fr': 'Monastir',
    },
    'bijuro7o': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'aryy87qj': {
      'en': '\tBab Gharbi 5000 Monastir - MONASTIR',
      'ar': 'باب غربي 5000 المنستير - المنستير',
      'fr': 'Bab Gharbi 5000 Monastir - MONASTIR',
    },
    'is1yta0i': {
      'en': '\tplace du 14 Janvier 5050 Moknine - MONASTIR',
      'ar': 'Place du 14 Janvier 5050 Moknine - MONASTIR',
      'fr': 'place du 14 Janvier 5050 Moknine - MONASTIR',
    },
    'ij5bzp7g': {
      'en': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'ar': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'fr': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
    },
    'i7ilh8m2': {
      'en': 'Insérer la Station',
      'ar': 'Insérer la Station',
      'fr': 'Insérer la Station',
    },
    'abiqanvu': {
      'en': 'Insérer la ligne',
      'ar': 'Insérer la ligne',
      'fr': 'Insérer la ligne',
    },
    'wr2q1361': {
      'en': 'travel',
      'ar': 'يسافر',
      'fr': 'voyage',
    },
    '0qzzbx9m': {
      'en': 'Shop',
      'ar': 'محل',
      'fr': 'Boutique',
    },
  },
  // about
  {
    '3iq1nufv': {
      'en': 'STS SAHEL',
      'ar': 'STS سهل',
      'fr': 'STS SAHEL',
    },
    'y77g2onh': {
      'en':
          'La société STS, STE DE TRANSPORT DU SAHEL spécialisée Transports Urbains Et Regionaux De Voyageurs. ',
      'ar':
          'La société STS، STE DE TRANSPORT DU SAHEL spécialisée Transports Urbains Et Regionaux De Voyageurs.',
      'fr':
          'La société STS, STE DE TRANSPORT DU SAHEL spécialisée Transports Urbains Et Régionaux De Voyageurs.',
    },
    'nl3nurjh': {
      'en': 'Website',
      'ar': 'موقع إلكتروني',
      'fr': 'Site Internet',
    },
    'q4qdsq3c': {
      'en': 'About   developer  ',
      'ar': 'عن المطور',
      'fr': 'À propos du développeur',
    },
    'o14mia92': {
      'en':
          'Stay in the loop with trip plans, places to go and transportation.',
      'ar': 'ابق على اطلاع بخطط الرحلات وأماكن الذهاب إليها ووسائل النقل.',
      'fr':
          'Restez au courant des plans de voyage, des endroits où aller et du transport.',
    },
    'napjix4f': {
      'en': 'contact developer  ',
      'ar': 'اتصل بالمطور',
      'fr': 'contacter le développeur',
    },
    'l304lxoe': {
      'en': 'Track Expenses',
      'ar': 'تتبع المصروفات',
      'fr': 'Suivre les dépenses',
    },
    'odxld7zy': {
      'en':
          'Don’t overspend on your trip, track all your expenses within the application.',
      'ar': 'لا تفرط في الإنفاق على رحلتك ، وتتبع جميع نفقاتك داخل التطبيق.',
      'fr':
          'Ne dépensez pas trop pour votre voyage, suivez toutes vos dépenses dans l\'application.',
    },
    'nvzmv6y0': {
      'en': 'Explore Now',
      'ar': 'استكشف الآن',
      'fr': 'Explorez maintenant',
    },
    'yp7jdb3t': {
      'en': 'About',
      'ar': 'عن',
      'fr': 'À propos',
    },
    'tzmlgzoc': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // hamadi
  {
    'yi6k4lm8': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // userpage
  {
    'u7zb3ppd': {
      'en': ' Guest USER',
      'ar': 'كل الرحلات',
      'fr': 'Tous les voyages',
    },
    'dd9pw4so': {
      'en': 'welcome ',
      'ar': 'مرحباً',
      'fr': 'accueillir',
    },
    'lncb10dy': {
      'en':
          '\nThank you for choosing STS Travels! We hope you have a wonderful day ahead, filled with exciting travels and unforgettable experiences. Whether you\'re embarking on a new adventure or returning home, may your journey be safe, comfortable, and filled with joy. Have a great day!',
      'ar':
          'نأمل أن يكون أمامك يوم رائع ، مليء بالرحلات المثيرة والتجارب التي لا تُنسى',
      'fr':
          'Nous espérons que vous avez une merveilleuse journée à venir, remplie de voyages passionnants et d\'expériences inoubliables',
    },
    'rcf8qt0k': {
      'en': 'Travel  ',
      'ar': 'يسافر',
      'fr': 'Voyage',
    },
    '0yyjwf8i': {
      'en': ' Station',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'j4s6duz9': {
      'en': 'today travel  ',
      'ar': 'سفرك اليوم',
      'fr': 'Votre voyage aujourd\'hui',
    },
    'plk5r5fi': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'o3hh6vm9': {
      'en': 'Houssem eddine khoildi',
      'ar': 'حسام الدين خويلدي',
      'fr': 'Houssem eddine khoildi',
    },
    'peuysft8': {
      'en': 'View',
      'ar': 'منظر',
      'fr': 'Voir',
    },
    'o8cvikdr': {
      'en': 'home',
      'ar': 'بيت',
      'fr': 'maison',
    },
  },
  // userstation
  {
    'i18rvarw': {
      'en': 'Search for your ....',
      'ar': 'ابحث عن ....',
      'fr': 'Recherchez votre ....',
    },
    'wr1ejosp': {
      'en': 'Mahdia',
      'ar': 'المهدية',
      'fr': 'Mahdia',
    },
    'dqhral3q': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'qtbr2715': {
      'en': 'rte de Sousse 5160 El Jem - MAHDIA',
      'ar': 'rte de Sousse 5160 الجم - المهدية',
      'fr': 'rte de Sousse 5160 El Jem - MAHDIA',
    },
    'ict6fkcd': {
      'en': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
      'ar': 'شارع ابن شرف 5100 المهدية - المهدية',
      'fr': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
    },
    'qdecg7vi': {
      'en': 'Sousse',
      'ar': 'سوسة',
      'fr': 'Sousse',
    },
    'hwsc22tt': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'o6ngjwbj': {
      'en': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
      'ar': 'شارع ليوبولد سنغور 4000 سوسة - سوسة',
      'fr': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
    },
    'gp7q4bem': {
      'en': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'ar': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'fr': 'Avenue de la République 4030 Enfidha - SOUSSE',
    },
    '7jq0rebs': {
      'en': 'Monastir',
      'ar': 'المنستير',
      'fr': 'Monastir',
    },
    '6txup8ux': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'yvgdrmy6': {
      'en': '\tBab Gharbi 5000 Monastir - MONASTIR',
      'ar': 'باب غربي 5000 المنستير - المنستير',
      'fr': 'Bab Gharbi 5000 Monastir - MONASTIR',
    },
    '1808wr4p': {
      'en': '\tplace du 14 Janvier 5050 Moknine - MONASTIR',
      'ar': 'Place du 14 Janvier 5050 Moknine - MONASTIR',
      'fr': 'place du 14 Janvier 5050 Moknine - MONASTIR',
    },
    '55snc7vq': {
      'en': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'ar': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'fr': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
    },
    'bshx6bye': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'krp08lcb': {
      'en': 'Shop',
      'ar': 'محل',
      'fr': 'Boutique',
    },
  },
  // usertravel
  {
    'nwpkjhy1': {
      'en': 'Search for your ....',
      'ar': 'ابحث عن ....',
      'fr': 'Recherchez votre ....',
    },
    'ie58qgun': {
      'en': 'Mahdia',
      'ar': 'المهدية',
      'fr': 'Mahdia',
    },
    'o05lh1s6': {
      'en': 'travel',
      'ar': 'يسافر',
      'fr': 'voyage',
    },
    'mdpp3wa4': {
      'en': 'rte de Sousse 5160 El Jem - MAHDIA',
      'ar': 'rte de Sousse 5160 الجم - المهدية',
      'fr': 'rte de Sousse 5160 El Jem - MAHDIA',
    },
    '8b0cnklb': {
      'en': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
      'ar': 'شارع ابن شرف 5100 المهدية - المهدية',
      'fr': 'Rue Ibn Charaf 5100 Mahdia - MAHDIA',
    },
    '2vgyqb1e': {
      'en': 'Sousse',
      'ar': 'سوسة',
      'fr': 'Sousse',
    },
    'x4cgemp3': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'x423hhio': {
      'en': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
      'ar': 'شارع ليوبولد سنغور 4000 سوسة - سوسة',
      'fr': 'Avenue Léopold Senghor 4000 Sousse - SOUSSE',
    },
    '72ra0yfz': {
      'en': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'ar': 'Avenue de la République 4030 Enfidha - SOUSSE',
      'fr': 'Avenue de la République 4030 Enfidha - SOUSSE',
    },
    'hnbzhjcv': {
      'en': 'Monastir',
      'ar': 'المنستير',
      'fr': 'Monastir',
    },
    'aa8dasrx': {
      'en': ' Station ',
      'ar': 'محطة',
      'fr': 'Gare',
    },
    'myw3dai1': {
      'en': '\tBab Gharbi 5000 Monastir - MONASTIR',
      'ar': 'باب غربي 5000 المنستير - المنستير',
      'fr': 'Bab Gharbi 5000 Monastir - MONASTIR',
    },
    'kdx9plpe': {
      'en': '\tplace du 14 Janvier 5050 Moknine - MONASTIR',
      'ar': 'Place du 14 Janvier 5050 Moknine - MONASTIR',
      'fr': 'place du 14 Janvier 5050 Moknine - MONASTIR',
    },
    '0ybpmhop': {
      'en': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'ar': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
      'fr': 'Avenue du 14 Janvier 5020 Jemmel - MONASTIR',
    },
    '9a53dhx5': {
      'en': 'travel',
      'ar': 'يسافر',
      'fr': 'voyage',
    },
    '6o2c989s': {
      'en': 'Shop',
      'ar': 'محل',
      'fr': 'Boutique',
    },
  },
  // SearchBar
  {
    'ct191orh': {
      'en': 'Search for friends...',
      'ar': 'البحث عن أصدقاء...',
      'fr': 'Rechercher des amis...',
    },
    'd5ek05vn': {
      'en': 'Find your friend by na',
      'ar': 'ابحث عن صديقك عن طريق na',
      'fr': 'Trouvez votre ami par na',
    },
  },
  // friendList
  {
    'l9drfkbq': {
      'en': 'Alex Edwards',
      'ar': 'أليكس إدواردز',
      'fr': 'Alex Edwards',
    },
    'vysklcot': {
      'en': '[userEmail]',
      'ar': '[البريد الالكتروني للمستخدم]',
      'fr': '[utilisateurEmail]',
    },
  },
  // emptyList
  {
    'yex6oq8l': {
      'en': 'No Messages',
      'ar': 'لا رسائل',
      'fr': 'Pas de messages',
    },
    '63l4u1oa': {
      'en':
          'Seems you don\'t have any messages here, search your friends list in order to get started.',
      'ar':
          'يبدو أنه ليس لديك أي رسائل هنا ، ابحث في قائمة أصدقائك من أجل البدء.',
      'fr':
          'Il semble que vous n\'ayez pas de messages ici, recherchez dans votre liste d\'amis pour commencer.',
    },
    '76o03bi3': {
      'en': 'Find Friends',
      'ar': 'البحث عن أصدقاء',
      'fr': 'Retrouver des amis',
    },
  },
  // ajutestation
  {
    'jx53i3qw': {
      'en': 'new station ',
      'ar': 'محطة جديدة',
      'fr': 'nouvelle gare',
    },
    'zzviksz5': {
      'en': 'Station Name',
      'ar': 'اسم المحطة',
      'fr': 'Nom de la station',
    },
    'cs0y5975': {
      'en': 'Address:',
      'ar': 'عنوان:',
      'fr': 'Adresse:',
    },
    '1g6fet6d': {
      'en': 'lang ',
      'ar': 'لانج',
      'fr': 'langue',
    },
    'rhrf9a5r': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    '3k74ieop': {
      'en': 'Continue',
      'ar': 'يكمل',
      'fr': 'Continuer',
    },
  },
  // Miscellaneous
  {
    '2rg774ga': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'lvezylrs': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'c8uhz6b2': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'vfas20qy': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'fh7liptx': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hb9ty3rr': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '3c9cicxm': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'o59a3qcu': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'gvy25fh7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'h3ij6o1y': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'fpbhcb8p': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '39n74tyn': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ec4qytp5': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '2aaon6mk': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'bpowcmp3': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ejz9hein': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mmde5n44': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'bclacw85': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '6lgeneut': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'v5dw1itl': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '48keo6t3': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5n849j2i': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'k5278cvt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
