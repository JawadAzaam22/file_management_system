// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settingsScreen {
    return Intl.message(
      'Settings',
      name: 'settingsScreen',
      desc: '',
      args: [],
    );
  }

  /// `S E T T I N G S`
  String get settings {
    return Intl.message(
      'S E T T I N G S',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about {
    return Intl.message(
      'About Us',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `G R O U P S`
  String get groups {
    return Intl.message(
      'G R O U P S',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `I N V I T A T I O N S`
  String get invitation {
    return Intl.message(
      'I N V I T A T I O N S',
      name: 'invitation',
      desc: '',
      args: [],
    );
  }

  /// `N O T I F I C A T I O N S`
  String get notifications {
    return Intl.message(
      'N O T I F I C A T I O N S',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `change password`
  String get changepassword {
    return Intl.message(
      'change password',
      name: 'changepassword',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get email {
    return Intl.message(
      'Email:',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enteryouremail {
    return Intl.message(
      'Enter Your Email',
      name: 'enteryouremail',
      desc: '',
      args: [],
    );
  }

  /// `Password:`
  String get password {
    return Intl.message(
      'Password:',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterpassword {
    return Intl.message(
      'Enter Password',
      name: 'enterpassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Your Password?`
  String get forgetpassword {
    return Intl.message(
      'Forget Your Password?',
      name: 'forgetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signin {
    return Intl.message(
      'Sign in',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `You Don't Have An Account?`
  String get donthaveaccount {
    return Intl.message(
      'You Don\'t Have An Account?',
      name: 'donthaveaccount',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signup {
    return Intl.message(
      'SIGN UP',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `please enter your email`
  String get emailvalidation {
    return Intl.message(
      'please enter your email',
      name: 'emailvalidation',
      desc: '',
      args: [],
    );
  }

  /// `please enter your password`
  String get passvalidation {
    return Intl.message(
      'please enter your password',
      name: 'passvalidation',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get name {
    return Intl.message(
      'Name:',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get entername {
    return Intl.message(
      'Enter Your Name',
      name: 'entername',
      desc: '',
      args: [],
    );
  }

  /// `User Name:`
  String get username {
    return Intl.message(
      'User Name:',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your UserName`
  String get enterusername {
    return Intl.message(
      'Enter Your UserName',
      name: 'enterusername',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation:`
  String get passwordconf {
    return Intl.message(
      'Password Confirmation:',
      name: 'passwordconf',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password Confirmation`
  String get enterpassconf {
    return Intl.message(
      'Enter Password Confirmation',
      name: 'enterpassconf',
      desc: '',
      args: [],
    );
  }

  /// `please enter your Password Confirmation`
  String get passconfvalidation {
    return Intl.message(
      'please enter your Password Confirmation',
      name: 'passconfvalidation',
      desc: '',
      args: [],
    );
  }

  /// `please enter your Name`
  String get namevalidation {
    return Intl.message(
      'please enter your Name',
      name: 'namevalidation',
      desc: '',
      args: [],
    );
  }

  /// `please enter your User Name `
  String get usernamevalidation {
    return Intl.message(
      'please enter your User Name ',
      name: 'usernamevalidation',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
