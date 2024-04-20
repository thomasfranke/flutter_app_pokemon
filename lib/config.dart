import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'exports.dart';

enum IAPEnum { pro }

class Config {
  // App:
  static final ConfigModel config = ConfigModel(
    production: false,
    appTitle: "Planner Annie",
    appToken: "26",
    appId: "26",
    appVersion: 1000,
    androidId: "",
    appleId: "6478479514",
  );

  // Date Format:
  static DateFormat formatDateDMY = DateFormat('dd/MM/yyyy');
  static DateFormat formatDateMDY = DateFormat('MM/dd/yyyy');
  static DateFormat formatDate = DateFormat('yyyy-MM-dd');
  static DateFormat formatTime12 = DateFormat('hh:mm a');
  static DateFormat formatTime24 = DateFormat('HH:mm');

  // Email:
  static final HelpersEmailModel email = HelpersEmailModel(
    mEmail: 'contato@frankeapps.com',
    mSubject: 'Planner Annie Support',
    mBody: 'Your app is awesome :)',
  );

  // IAP:
  static final List<IAPModel> iapList = [
    IAPModel(index: IAPEnum.pro.index, idiOS: "com.frankeapps.plannerannie.pro", idAndroid: ""),
  ];

  // Social Media:
  static final SocialMediaModel socialMedia = SocialMediaModel(
    facebook: '',
    twitterX: '',
    youTube: '',
  );

  // AdMob:
  static final AdMobModel adMob = AdMobModel(
    realAds: true,
    showAppOpen: false,
    showBanner: true,
    showInterstitial: false,
    showRewarded: false,
    idAndroidAppOpen: '',
    idAndroidBanner: '',
    idAndroidInterstitial: '',
    idAndroidRewarded: '',
    idAppleAppOpen: '',
    idAppleBanner: 'ca-app-pub-2818356037442019/1605131601',
    idAppleInterstitial: '',
    idAppleRewarded: '',
  );

  // Styles:
  static bool darkMode = true;
  static HelpersStylesModel styles = HelpersStylesModel(
    text: TextStyle(color: Config.darkMode ? ConstantsColors.readerTextDark : ConstantsColors.readerText, fontFamily: 'OpenSans', fontSize: 16.0, height: 1.5),
    textBold: TextStyle(
        color: Config.darkMode ? ConstantsColors.readerTextDark : ConstantsColors.readerText, fontFamily: 'OpenSans', fontSize: 16.0, fontWeight: FontWeight.bold),
    textButton: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
    ).copyWith(color: Config.darkMode ? ConstantsColors.readerTextDark : ConstantsColors.readerText, fontSize: 20.0),
    textItalic: TextStyle(
        color: Config.darkMode ? ConstantsColors.readerTextDark : ConstantsColors.readerText, fontFamily: 'OpenSans', fontSize: 16.0, fontStyle: FontStyle.italic),
    textLink: TextStyle(color: Config.darkMode ? ConstantsColors.primary : ConstantsColors.primary, fontFamily: 'OpenSans', fontSize: 16.0),
    title: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 28, color: Config.darkMode ? ConstantsColors.readerTitle : ConstantsColors.readerTitle),
    titleAppBar: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 28, color: Config.darkMode ? ConstantsColors.primary : ConstantsColors.primary),
    titleSub: GoogleFonts.oswald(fontWeight: FontWeight.w600).copyWith(fontSize: 22, color: Config.darkMode ? ConstantsColors.primary : ConstantsColors.primary),
  );
}
