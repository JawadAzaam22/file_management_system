import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @settingsScreen.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsScreen;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'S E T T I N G S'**
  String get settings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get about;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'G R O U P S'**
  String get groups;

  /// No description provided for @invitation.
  ///
  /// In en, this message translates to:
  /// **'I N V I T A T I O N S'**
  String get invitation;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'N O T I F I C A T I O N S'**
  String get notifications;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @changepassword.
  ///
  /// In en, this message translates to:
  /// **'change password'**
  String get changepassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email:'**
  String get email;

  /// No description provided for @enteryouremail.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get enteryouremail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password:'**
  String get password;

  /// No description provided for @enterpassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterpassword;

  /// No description provided for @forgetpassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Your Password?'**
  String get forgetpassword;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signin;

  /// No description provided for @donthaveaccount.
  ///
  /// In en, this message translates to:
  /// **'You Don\'t Have An Account?'**
  String get donthaveaccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get signup;

  /// No description provided for @emailvalidation.
  ///
  /// In en, this message translates to:
  /// **'please enter your email'**
  String get emailvalidation;

  /// No description provided for @passvalidation.
  ///
  /// In en, this message translates to:
  /// **'please enter your password'**
  String get passvalidation;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name:'**
  String get name;

  /// No description provided for @entername.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get entername;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'User Name:'**
  String get username;

  /// No description provided for @enterusername.
  ///
  /// In en, this message translates to:
  /// **'Enter Your UserName'**
  String get enterusername;

  /// No description provided for @passwordconf.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation:'**
  String get passwordconf;

  /// No description provided for @enterpassconf.
  ///
  /// In en, this message translates to:
  /// **'Enter Password Confirmation'**
  String get enterpassconf;

  /// No description provided for @passconfvalidation.
  ///
  /// In en, this message translates to:
  /// **'please enter your Password Confirmation'**
  String get passconfvalidation;

  /// No description provided for @namevalidation.
  ///
  /// In en, this message translates to:
  /// **'please enter your Name'**
  String get namevalidation;

  /// No description provided for @usernamevalidation.
  ///
  /// In en, this message translates to:
  /// **'please enter your User Name '**
  String get usernamevalidation;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @newGroup.
  ///
  /// In en, this message translates to:
  /// **'add a newGroup'**
  String get newGroup;

  /// No description provided for @groupsScreen.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groupsScreen;

  /// No description provided for @yourGroups.
  ///
  /// In en, this message translates to:
  /// **'Your Groups'**
  String get yourGroups;

  /// No description provided for @memberOf.
  ///
  /// In en, this message translates to:
  /// **'Groups you are a member of'**
  String get memberOf;

  /// No description provided for @welcomeSentence.
  ///
  /// In en, this message translates to:
  /// **'    Share your files now and let the collaboration begin!'**
  String get welcomeSentence;

  /// No description provided for @aboutScreen.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutScreen;

  /// No description provided for @notificationScreen.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationScreen;

  /// No description provided for @invitationScreen.
  ///
  /// In en, this message translates to:
  /// **'Invitation'**
  String get invitationScreen;

  /// No description provided for @noinvitation.
  ///
  /// In en, this message translates to:
  /// **'No invitations available.'**
  String get noinvitation;

  /// No description provided for @emailcode.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to send code'**
  String get emailcode;

  /// No description provided for @codecheck.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit that sent to you'**
  String get codecheck;

  /// No description provided for @newpassword.
  ///
  /// In en, this message translates to:
  /// **'Enter a new password'**
  String get newpassword;

  /// No description provided for @sendcode.
  ///
  /// In en, this message translates to:
  /// **'send code'**
  String get sendcode;

  /// No description provided for @check.
  ///
  /// In en, this message translates to:
  /// **'check'**
  String get check;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'confirm'**
  String get confirm;

  /// No description provided for @forgrtpasswordscreen.
  ///
  /// In en, this message translates to:
  /// **'forget password'**
  String get forgrtpasswordscreen;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'code'**
  String get code;

  /// No description provided for @groupsfiles.
  ///
  /// In en, this message translates to:
  /// **'Group\'s Files'**
  String get groupsfiles;

  /// No description provided for @newfilesreq.
  ///
  /// In en, this message translates to:
  /// **'New Files Request'**
  String get newfilesreq;

  /// No description provided for @myreserved.
  ///
  /// In en, this message translates to:
  /// **'My Reserved Files'**
  String get myreserved;

  /// No description provided for @members.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get members;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @leavegroup.
  ///
  /// In en, this message translates to:
  /// **'Leave Group'**
  String get leavegroup;

  /// No description provided for @filename.
  ///
  /// In en, this message translates to:
  /// **'File Name'**
  String get filename;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'  Owner  '**
  String get owner;

  /// No description provided for @lastmodified.
  ///
  /// In en, this message translates to:
  /// **'Last Modified'**
  String get lastmodified;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @preversion.
  ///
  /// In en, this message translates to:
  /// **'Previous Version'**
  String get preversion;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alert;

  /// No description provided for @youwantdel.
  ///
  /// In en, this message translates to:
  /// **'You Want Delete File?'**
  String get youwantdel;

  /// No description provided for @uploadedby.
  ///
  /// In en, this message translates to:
  /// **'Uploaded By:'**
  String get uploadedby;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @uploadedtime.
  ///
  /// In en, this message translates to:
  /// **'Uploade Time:'**
  String get uploadedtime;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept:'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @reservtime.
  ///
  /// In en, this message translates to:
  /// **'Reservation Time:'**
  String get reservtime;

  /// No description provided for @checkin.
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get checkin;

  /// No description provided for @canselselect.
  ///
  /// In en, this message translates to:
  /// **'Cansel Select'**
  String get canselselect;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'create'**
  String get create;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'description:'**
  String get description;

  /// No description provided for @enterdescriotion.
  ///
  /// In en, this message translates to:
  /// **'Enter descriotion'**
  String get enterdescriotion;

  /// No description provided for @descriptionvalidation.
  ///
  /// In en, this message translates to:
  /// **'please enter your description:'**
  String get descriptionvalidation;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'group name :'**
  String get group;

  /// No description provided for @entergroub.
  ///
  /// In en, this message translates to:
  /// **'Enter group'**
  String get entergroub;

  /// No description provided for @groubvalidation.
  ///
  /// In en, this message translates to:
  /// **'please enter your group::'**
  String get groubvalidation;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @addMember.
  ///
  /// In en, this message translates to:
  /// **'add the member'**
  String get addMember;

  /// No description provided for @createGroup.
  ///
  /// In en, this message translates to:
  /// **'create group'**
  String get createGroup;

  /// No description provided for @verifyAcc.
  ///
  /// In en, this message translates to:
  /// **'verify your account'**
  String get verifyAcc;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get ready;

  /// No description provided for @splashH2.
  ///
  /// In en, this message translates to:
  /// **'share your files with our group '**
  String get splashH2;

  /// No description provided for @splashH1.
  ///
  /// In en, this message translates to:
  /// **'File Mangement System'**
  String get splashH1;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'refresh'**
  String get refresh;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
