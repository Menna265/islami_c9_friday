import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage='en';
  ThemeData appTheme=ThemeData.dark();
  void changeLanguage (String newLanguage){
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage=newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeData newTheme){
    if(appTheme==newTheme){
      return;
    }
    appTheme=newTheme;
    notifyListeners();

  }
}